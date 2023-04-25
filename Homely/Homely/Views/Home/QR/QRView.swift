//
//  QRView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 24.04.2023.
//

import SwiftUI

struct QRView: View {
    @StateObject var viewModel = QRViewModel()
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        VStack(spacing: 70) {
            descriptionView
            qrCamera
            qrButton
            
            Text("По истечению скрока годности, ваши избранные товары добавятся в список покупок автоматически!")
                .medium(14)
                .foregroundColor(.textColor())
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
        }
        .padding(.horizontal, .Constants.spacing)
        .alert(viewModel.errorMessage, isPresented: $viewModel.showError) {
            if viewModel.cameraPermission == .denied {
                alertView
            }
        }
        .onAppear(perform: viewModel.checkCameraPermission)
        .onChange(of: viewModel.qrDelegate.scannedCode) { newValue in
            if let code = newValue {
                viewModel.getNewCodeValue(code)
            }
        }
        .background(Color.backgroundColor())
    }
    
    //MARK: - descriptionView
    
    var descriptionView: some View {
        Text("Отсканируйте QR продукта - вам придет уведомление о том, когда закончится срок годности!")
            .bold(16)
            .foregroundColor(.textColor())
            .multilineTextAlignment(.center)
            .padding(.horizontal, 30)
            .padding(.top, 70)
    }
    
    //MARK: - qrCamera
    
    var qrCamera: some View {
        GeometryReader {
            let size = $0.size
            
            ZStack {
                CameraView(session: $viewModel.session, frameSize: CGSize(width: size.width, height: size.width))
                    .scaleEffect(0.97)
                frameView
            }
            .frame(width: size.width, height: size.width)
            .overlay {
                ScanLine(size)
            }
        }
        .padding(.horizontal, 40)
    }
    
    var frameView: some View {
        ForEach(0...4, id: \.self) { index in
            let rotate = Double(index) * 90
            
            RoundedRectangle(cornerRadius: 2, style: .circular)
                .trim(from: 0.61, to: 0.64)
                .stroke(Color.homeColor(), style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .rotationEffect(.init(degrees: rotate))
        }
    }
    
    @ViewBuilder
    func ScanLine(_ size: CGSize) -> some View {
        Rectangle()
            .fill(Color.homeColor())
            .frame(height: 2.5)
            .shadow(color: .black.opacity(0.6), radius: 8, x: 0, y: viewModel.isScanning ? 15 : -15)
            .offset(y: viewModel.isScanning ? size.width : 0)
            .padding(.bottom, size.width)
    }
    
    //MARK: - qrButton
    
    var qrButton: some View {
        Button {
             viewModel.b()
        } label: {
            RectangleButton(
                imageName: "qrcode.viewfinder",
                buttonSize: 35,
                iconSize: 25,
                bgColor: .elementColor()
            )
        }
    }
    
    //MARK: - alertView
    
    var alertView: some View {
        Group {
            Button("Settings") {
                let settingsString = UIApplication.openSettingsURLString
                if let settingsURL = URL(string: settingsString) {
                    openURL(settingsURL)
                }
            }
            
            Button("Cancel", role: .cancel) {
                
            }
        }
    }
}

//MARK: - Previews

struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView()
    }
}

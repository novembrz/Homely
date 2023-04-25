//
//  CameraView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 25.04.2023.
//

import SwiftUI
import AVKit

struct CameraView: UIViewRepresentable {

    @Binding var session: AVCaptureSession
    var frameSize: CGSize
    
    func makeUIView(context: Context) -> UIView {
        let view = UIViewType(frame: CGRect(origin: .zero, size: frameSize))
        view.backgroundColor = .clear
        
        let cameraLayer = AVCaptureVideoPreviewLayer(session: session)
        cameraLayer.frame = .init(origin: .zero, size: frameSize)
        cameraLayer.videoGravity = .resizeAspectFill
        cameraLayer.masksToBounds = true
        view.layer.addSublayer(cameraLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

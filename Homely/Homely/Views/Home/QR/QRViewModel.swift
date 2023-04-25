//
//  QRViewModel.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 24.04.2023.
//

import SwiftUI
import AVKit

extension QRView {
    @MainActor class QRViewModel: ObservableObject {
        @Published var isScanning = false
        @Published var showError = false
        @Published var errorMessage = ""
        @Published var scannedCode: String?
        
        @Published var session: AVCaptureSession = .init()
        @Published var qrOutput: AVCaptureMetadataOutput = .init()
        
        @Published var cameraPermission: CameraPermission = .idle
        
        @StateObject var qrDelegate = QRDelegate()
        
        //MARK: - checkCameraPermission
        
        func checkCameraPermission() {
            Task {
                switch AVCaptureDevice.authorizationStatus(for: .video) {
                case .authorized:
                    await authorizedPermission()
                case .denied, .restricted:
                    deniedAndRestrictedPermission()
                case .notDetermined:
                    await notDeterminedPermission()
                default: break
                }
            }
        }
        
        private func authorizedPermission() async {
            cameraPermission = .approved
            if session.inputs.isEmpty {
                await setupCamera()
            } else {
                session.startRunning()
            }
        }
        
        private func deniedAndRestrictedPermission() {
            cameraPermission = .denied
            presentError("Пожалуйста, дайте разрешение на сканирование через камеру")
        }
        
        private func notDeterminedPermission() async {
            if await AVCaptureDevice.requestAccess(for: .video) {
                cameraPermission = .approved
            } else {
                cameraPermission = .denied
                presentError("Пожалуйста, дайте разрешение на сканирование через камеру")
            }
        }
        
        //MARK: - setupCamera
        
        private func setupCamera() async {
            do {
                guard let device = AVCaptureDevice.DiscoverySession(
                    deviceTypes: [.builtInUltraWideCamera],//[.builtInUltraWideCamera],
                    mediaType: .video,
                    position: .back
                ).devices.first else {
                    presentError("Неизвестная ошибка девайса")
                    return
                }
                
                let input = try AVCaptureDeviceInput(device: device)
                guard session.canAddInput(input), session.canAddOutput(qrOutput) else {
                    presentError("Неизвестная input/output ошибка")
                    return
                }
                
                setupSession(input: input)
                activeScannerAnimation()
            } catch {
                presentError(error.localizedDescription)
            }
        }
        
        private func setupSession(input: AVCaptureDeviceInput) {
            session.beginConfiguration()
            session.addInput(input)
            session.addOutput(qrOutput)
            
            qrOutput.metadataObjectTypes = [.qr]
            qrOutput.setMetadataObjectsDelegate(qrDelegate, queue: .main)
            
            session.commitConfiguration()
            
            Task.detached { //bacgtoend
                await self.session.startRunning()
            }
        }
        
        //MARK: - button
        
        func b() {
            Task {
                await a()
            }
        }
        
        func a() async {
            if session.isRunning && cameraPermission == .approved {
                await reactivateCamera()
                activeScannerAnimation()
            }
        }
        
        func reactivateCamera() async {
            Task.detached {
                await self.session.startRunning
            }
        }
        
        //MARK: - presentError
        
        private func presentError(_ message: String) {
            errorMessage = message
            showError.toggle()
        }
        
        //MARK: - getNewCodeValue
        
        func getNewCodeValue(_ code: String) {
            scannedCode = code
            session.stopRunning()
            deActiveScannerAnimation()
            qrDelegate.scannedCode = nil
        }
        
        //MARK: - Animation
        
        private func activeScannerAnimation() {
            withAnimation(.easeInOut(duration: 0.85).delay(0.1).repeatForever(autoreverses: true)) {
                isScanning = true
            }
        }
        
        private func deActiveScannerAnimation() {
            withAnimation(.easeInOut(duration: 0.85)) {
                isScanning = false
            }
        }
    }
}

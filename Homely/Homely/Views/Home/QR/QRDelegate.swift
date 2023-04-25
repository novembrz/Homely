//
//  QRDelegate.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 25.04.2023.
//

import SwiftUI
import AVKit

class QRDelegate: NSObject, ObservableObject, AVCaptureMetadataOutputObjectsDelegate {
    
    @Published var scannedCode: String?
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metaObject = metadataObjects.first {
            guard let readableObject = metaObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let scannedCode = readableObject.stringValue else { return }
            
            print("🎃", scannedCode)
            self.scannedCode = scannedCode
        }
    }
}

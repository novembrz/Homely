//
//  SecurityCamerasView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 29.10.2022.
//

import SwiftUI

struct SecurityCamerasView: View {
    var cameras: [SecurityСamera]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 11) {
            Text(String.securityCameras)
                .font(.regular(15))
                .foregroundColor(.textColor())
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 11) {
                    ForEach(cameras, id: \.self) { camera in
                        ChooseButton(icon: .getImage(camera.icon),
                                     tint: .homeColor()) { isActive in
                            print("cameras")
                        }
                    }
                }
                
                Spacer()
            }
        }
        .padding(14)
        .background(Color.elementColor())
        .cornerRadius(.Constants.cornerRadius)
    }
}

//MARK: - Extensions

private extension String {
    static let securityCameras = "Камеры видеонаблюдения"
}

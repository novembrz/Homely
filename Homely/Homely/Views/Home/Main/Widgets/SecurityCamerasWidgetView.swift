//
//  SecurityCamerasView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 29.10.2022.
//

import SwiftUI

struct SecurityCamerasWidgetView: View {
    var cameras: [SecurityСamera]
    
    var body: some View {
        CustomNavigationLink {
            widget
        } destination: {
            SecurityView()
        }
    }

    var widget: some View {
        VStack(alignment: .leading, spacing: .spacing) {
            Text(String.securityCameras)
                .regular(.textSize)
                .foregroundColor(.textColor())
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .spacing) {
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
        .padding(.padding)
        .background(Color.elementColor())
        .cornerRadius(.Constants.cornerRadius)
    }
}

//MARK: - Extensions

private extension String {
    static let securityCameras = "Камеры видеонаблюдения"
}

private extension CGFloat {
    static let spacing: CGFloat = 11
    static let textSize: CGFloat = 15
    static let padding: CGFloat = 14
}

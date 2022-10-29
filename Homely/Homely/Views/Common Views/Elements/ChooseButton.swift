//
//  ButtonToggle.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 21.10.2022.
//

import SwiftUI

struct ChooseButton: View {
    var icon: Image
    var tint: Color
    var completion: ((Bool) -> ())
    
    @State private var startAction = false
    
    var body: some View {
        Button {
            withAnimation {
                startAction.toggle()
                completion(startAction)
            }
        } label: {
            ZStack {
                icon
                    .resizable()
                    .frame(width: .iconSize, height: .iconSize)
                    .foregroundColor(startAction ? .white : .secondTextColor())
                    .padding(.padding)
                    .background(startAction ? tint : Color.backgroundColor())
                    .cornerRadius(.Constants.cornerRadius)
                
                if startAction {
                    Image.shadow()
                        .resizable()
                        .frame(width: .shadowSize, height: .shadowSize)
                        .opacity(.shadowOpacity)
                }
            }
        }
    }
}

//MARK: - Extensions

private extension Double {
    static let shadowOpacity = 0.9
}

private extension CGFloat {
    static let padding: CGFloat = 10
    static let iconSize: CGFloat = 17
    static let shadowSize: CGFloat = 37
}

//MARK: - Previews

struct ButtonToggle_Previews: PreviewProvider {
    static var previews: some View {
        ChooseButton(icon: Image.Icon.livingRoom(), tint: .homeColor()) { _ in }
    }
}

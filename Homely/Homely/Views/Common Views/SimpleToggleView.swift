//
//  SimpleToggleView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 20.10.2022.
//

import SwiftUI

struct SimpleToggleView: View {
    
    @State private var showGreeting = false
    
    var title: String
    var tint: Color
    var onAction: (() -> ())
    var offAction: (() -> ())
    
    var body: some View {
        VStack {
            Toggle(isOn: $showGreeting) {
                Text(title)
                    .font(.regular(.textSize))
                    .foregroundColor(.textColor())
            }
            .tint(tint)
        }
        .padding(.padding)
        .background(Color.backgroundColor())
        .cornerRadius(.radius)
        .onChange(of: showGreeting) { newValue in
            if showGreeting {
                onAction()
            } else {
                offAction()
            }
        }
    }
}

//MARK: - Previews

struct SimpleToggleView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleToggleView(title: "Пылесос", tint: .homeColor()) {
            print("💚 SimpleToggleView")
        } offAction: {
            print("💔 SimpleToggleView")
        }
    }
}

//MARK: - Extensions

private extension CGFloat {
    static let padding: CGFloat = 10
    static let radius: CGFloat = 9
    static let textSize: CGFloat = 12
}

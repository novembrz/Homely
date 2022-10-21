//
//  IconToggle.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 21.10.2022.
//

import SwiftUI

struct IconToggle: View {
    var icon: Image = .Icon.on()
    var tint: Color
    var onAction: (() -> ())
    var offAction: (() -> ())
    
    @State private var startAction = false
    
    var body: some View {
        Toggle("", isOn: $startAction)
            .labelsHidden()
            .tint(tint)
            .overlay {
                icon
                    .resizable()
                    .frame(width: 15, height: 15)
                    .offset(x: startAction ? 11 : -9)
                    .animation(.easeOut, value: startAction)
            }
            .onChange(of: startAction) { _ in
                if startAction {
                    onAction()
                } else {
                    offAction()
                }
            }
    }
}

//MARK: - Previews

struct IconToggle_Previews: PreviewProvider {
    static var previews: some View {
        IconToggle(tint: .homeColor()) {
            print("💚 SimpleToggleView")
        } offAction: {
            print("💔 SimpleToggleView")
        }
    }
}

//
//  TitleToggle.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 20.10.2022.
//

import SwiftUI

struct TitleToggle: View {
    var title: String
    var textSize: CGFloat = 12
    var tint: Color
    var onAction: (() -> ())
    var offAction: (() -> ())
    
    @State private var startAction = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.regular(textSize))
                .foregroundColor(.textColor())

            Toggle("", isOn: $startAction)
                .labelsHidden()
                .tint(tint)
        }
        .onChange(of: startAction) { newValue in
            if startAction {
                onAction()
            } else {
                offAction()
            }
        }
    }
}

//MARK: - Previews

struct TitleToggle_Previews: PreviewProvider {
    static var previews: some View {
        TitleToggle(title: "Пылесос и др товарищи", textSize: 14, tint: .homeColor()) {
            print("💚 SimpleToggleView")
        } offAction: {
            print("💔 SimpleToggleView")
        }
    }
}

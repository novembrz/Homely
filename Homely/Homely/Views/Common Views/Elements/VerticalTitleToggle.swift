//
//  TitleToggle.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 20.10.2022.
//

import SwiftUI

struct VerticalTitleToggle: View {
    var title: String
    var textSize: CGFloat = 12
    var tint: Color
    var completion: ((Bool) -> ())
    
    @State private var startAction = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .regular(textSize)
                .foregroundColor(.textColor())

            Toggle("", isOn: $startAction)
                .labelsHidden()
                .tint(tint)
        }
        .onChange(of: startAction) { newValue in
            completion(startAction)
        }
    }
}

//MARK: - Previews

struct VerticalTitleToggle_Previews: PreviewProvider {
    static var previews: some View {
        VerticalTitleToggle(title: "Пылесос и др товарищи", textSize: 14, tint: .homeColor()) { _ in }
    }
}

//MARK: - Delete

/*
struct VerticalTitleToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            VStack(alignment: .leading, spacing: 10) {
                configuration.label
                    .font(.regular(14))
                    .foregroundColor(.textColor())

                Toggle("", isOn: configuration.$isOn)
                    .labelsHidden()
            }

        }
        .buttonStyle(PlainButtonStyle())
    }
}

 Toggle(isOn: $startAction) {
     Text("Active")
 }
 .toggleStyle(PowerToggleStyle())
 */

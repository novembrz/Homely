//
//  PowerToggleStyle.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 21.10.2022.
//

import SwiftUI

struct PowerToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Rectangle()
                .foregroundColor(configuration.isOn ? .homeColor() : Color(hex: "DCDCE2"))
                .frame(width: 51, height: 31, alignment: .center)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 3)
                        .overlay(
                            Image(systemName: configuration.isOn ? "power" : "poweroff")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .font(Font.title.weight(.black))
                                .frame(width: 10, height: 10, alignment: .center)
                                .foregroundColor(.gray)
                        )
                        .offset(x: configuration.isOn ? 10 : -10, y: 0)
                        .animation(.linear(duration: 0.1), value: configuration.isOn)
                    
                )
                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}

/*
 Toggle(isOn: $startAction) {
     Text("Active")
 }
 .toggleStyle(PowerToggleStyle())
 */

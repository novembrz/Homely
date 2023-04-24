//
//  RectangleButton.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 24.04.2023.
//

import SwiftUI

struct RectangleButton: View {
    var icon: Image
    var buttonSize: CGFloat
    var iconSize: CGFloat
    var bgColor: Color
    
    var body: some View {
        icon
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: iconSize, height: iconSize)
            .foregroundColor(.textColor())
            .frame(width: buttonSize, height: buttonSize)
            .background(bgColor)
            .cornerRadius(.Constants.cornerRadius)
    }
}

struct RectangleButton_Previews: PreviewProvider {
    static var previews: some View {
        RectangleButton(
            icon: Image.Icon.fan(),
            buttonSize: 30,
            iconSize: 20,
            bgColor: .homeColor()
        )
    }
}

//
//  RectangleButton.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 24.04.2023.
//

import SwiftUI

struct RectangleButton: View {
    var icon: Image?
    var imageName: String?
    var buttonSize: CGFloat
    var iconSize: CGFloat
    var bgColor: Color
    
    //MARK: - Initialize
    
    public init(icon: Image, buttonSize: CGFloat, iconSize: CGFloat, bgColor: Color) {
        self.icon = icon
        self.imageName = nil
        self.buttonSize = buttonSize
        self.iconSize = iconSize
        self.bgColor = bgColor
    }
    
    public init(imageName: String, buttonSize: CGFloat, iconSize: CGFloat, bgColor: Color) {
        self.icon = nil
        self.imageName = imageName
        self.buttonSize = buttonSize
        self.iconSize = iconSize
        self.bgColor = bgColor
    }
    
    //MARK: - View
    
    var body: some View {
        (icon == nil ? Image(systemName: imageName!) : icon!)
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

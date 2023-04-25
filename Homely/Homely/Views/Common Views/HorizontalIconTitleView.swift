//
//  HorizontalIconTitleView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 25.04.2023.
//

import SwiftUI

struct HorizontalIconTitleView: View {
    let text: String
    let icon: Image
    let iconSize: CGFloat
    let textSize: CGFloat
    
    var body: some View {
        HStack(spacing: 4) {
            icon
                .resizable()
                .frame(width: iconSize, height: iconSize)
                .foregroundColor(.textColor())
            
            Text(text)
                .bold(textSize)
                .foregroundColor(.textColor())
        }
    }
}

struct HorizontalIconTitleView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalIconTitleView(text: "5", icon: Image.Icon.sun(), iconSize: 20, textSize: 20)
    }
}

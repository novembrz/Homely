//
//  IconTitleView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 24.04.2023.
//

import SwiftUI

struct VerticalIconTitleView: View {
    var title: String
    var icon: Image
    
    var body: some View {
        VStack(alignment: .leading, spacing: .spacing) {
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: .iconSize)
                .foregroundColor(.textColor())
            
            Text(title)
                .regular(.textSize)
                .foregroundColor(.textColor())
        }
    }
}

//MARK: - Extension

private extension CGFloat {
    static var iconSize: CGFloat = 24
    static var textSize: CGFloat = 12
    static var spacing: CGFloat = 6
}

//MARK: - Previews

struct IconTitleView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalIconTitleView(title: "Кондиционер", icon: .Icon.fan())
    }
}

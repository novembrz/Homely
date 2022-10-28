//
//  IconTitleToggleView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 21.10.2022.
//

import SwiftUI

struct IconTitleToggleView: View {
    var title: String
    var icon: Image
    var tint: Color
    var completion: ((Bool) -> ())
    
    @State private var startAction = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Toggle("", isOn: $startAction)
                .labelsHidden()
                .tint(tint)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: .spacing) {
                icon
                    .resizable()
                    .frame(width: .iconSize, height: .iconSize)
                    .foregroundColor(.textColor())
                
                Text(title)
                    .font(.regular(.textSize))
                    .foregroundColor(.textColor())
            }
        }
        .padding(.vertical, .verticalPadding)
        .padding(.horizontal, .horizontalPadding)
        .frame(minWidth: .minWidth, maxWidth: .maxWidth, alignment: .leading)
        .background(Color.backgroundColor())
        .cornerRadius(.Constants.cornerRadius)
        .onChange(of: startAction) { newValue in
            completion(startAction)
        }
    }
}

//MARK: - Extension

private extension CGFloat {
    static var iconSize: CGFloat = 24
    static var minWidth: CGFloat = 97
    static var maxWidth: CGFloat = 124
    static var spacing: CGFloat = 6
    static var verticalPadding: CGFloat = 15
    static var horizontalPadding: CGFloat = 8
    static var textSize: CGFloat = 12
}

//MARK: - Previews

struct IconTitleToggleView_Previews: PreviewProvider {
    static var previews: some View {
        IconTitleToggleView(title: "Кондиционер", icon: .Icon.fan(), tint: .red) { _ in }
    }
}


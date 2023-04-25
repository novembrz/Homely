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
            
            VerticalIconTitleView(title: title, icon: icon)
        }
        .padding(.vertical, .verticalPadding)
        .padding(.horizontal, .horizontalPadding)
        .frame(minWidth: .minWidth, maxWidth: .maxWidth, alignment: .leading)
        .background(Color.elementColor())
        .cornerRadius(.Constants.cornerRadius)
        .onChange(of: startAction) { newValue in
            completion(startAction)
        }
    }
}

//MARK: - Extension

private extension CGFloat {
    static var minWidth: CGFloat = 97
    static var maxWidth: CGFloat = 124
    static var verticalPadding: CGFloat = 15
    static var horizontalPadding: CGFloat = 8
}

//MARK: - Previews

struct IconTitleToggleView_Previews: PreviewProvider {
    static var previews: some View {
        IconTitleToggleView(title: "Кондиционер", icon: .Icon.fan(), tint: .red) { _ in }
    }
}


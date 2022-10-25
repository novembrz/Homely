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
            
            VStack(alignment: .leading, spacing: 6) {
                icon
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.textColor())
                
                Text(title)
                    .font(.regular(12))
                    .foregroundColor(.textColor())
            }
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 8)
        .frame(minHeight: 121)
        .background(Color.backgroundColor())
        .cornerRadius(.CommonSize.cornerRadius)
        .onChange(of: startAction) { newValue in
            completion(startAction)
        }
    }
}

//MARK: - Previews

struct IconTitleToggleView_Previews: PreviewProvider {
    static var previews: some View {
        IconTitleToggleView(title: "Кондиционер", icon: .Icon.fan(), tint: .red) { _ in }
    }
}


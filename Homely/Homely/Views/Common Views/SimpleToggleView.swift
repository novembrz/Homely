//
//  SimpleToggleView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 20.10.2022.
//

import SwiftUI

struct SimpleToggleView: View {
    var title: String
    var tint: Color
    var completion: ((Bool) -> ())
    
    @State private var startAction = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $startAction) {
                Text(title)
                    .font(.regular(.textSize))
                    .foregroundColor(.textColor())
            }
            .tint(tint)
        }
        .padding(.padding)
        .background(Color.backgroundColor())
        .cornerRadius(.CommonSize.cornerRadius)
        .onChange(of: startAction) { newValue in
            completion(startAction)
        }
    }
}

//MARK: - Extensions

private extension CGFloat {
    static let padding: CGFloat = 10
    static let textSize: CGFloat = 12
}

//MARK: - Previews

struct SimpleToggleView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleToggleView(title: "Пылесос", tint: .homeColor()) { _ in }
    }
}

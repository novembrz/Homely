//
//  FamilyView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 18.10.2022.
//

import SwiftUI

struct FamilyView: View {
    
    var body: some View {
        NavigationBlock(title: .family) {
            VStack(spacing: .Constants.spacing) {
                HStack {
                    Text("FamilyView")
                    Spacer()
                }
            }
        }
    }
}

//MARK: - Extensions

private extension String {
    static var family = "Семья"
}

//MARK: - Previews

struct FamilyView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyView()
    }
}

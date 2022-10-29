//
//  NavigationBlock.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 29.10.2022.
//

import SwiftUI

struct NavigationBlock<Content: View>: View {
    
    private var viewTitle: String
    private let content: Content
    
    //MARK: - Initialize
    
    public init(title: String, @ViewBuilder content: () -> Content) {
        self.viewTitle = title
        self.content = content()
    }
    
    //MARK: - View
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 15) {
                Text(viewTitle)
                    .font(.bold(35))
                    .foregroundColor(.textColor())
                
                content
            }
            .padding(.horizontal, .Constants.spacing)
            .padding(.top, 40)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
}

//MARK: - Previews

struct NavigationBlock_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBlock(title: "Home") {
            HomeView()
        }
    }
}


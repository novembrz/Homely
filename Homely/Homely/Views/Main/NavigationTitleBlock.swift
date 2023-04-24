//
//  NavigationBlock.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 29.10.2022.
//

import SwiftUI

struct NavigationTitleBlock<Content: View>: View {
    
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
            VStack(alignment: .leading, spacing: .stackSpacing) {
                Text(viewTitle)
                    .bold(.textSize)
                    .foregroundColor(.textColor())
                
                content
            }
            .padding(.horizontal, .Constants.spacing)
            .padding(.top, .topPadding)
            .padding(.bottom, .bottomPadding)
        }
        .background(Color.backgroundColor())
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
}

//MARK: - Extensions

private extension CGFloat {
    static var stackSpacing: CGFloat = 15
    static var textSize: CGFloat = 35
    static var topPadding: CGFloat = 20
    static var bottomPadding: CGFloat = 70
}

//MARK: - Previews

struct NavigationBlock_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


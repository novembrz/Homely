//
//  PersonView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 18.10.2022.
//

import SwiftUI

//PIZDEC DLA IPAD
struct PersonView: View {
    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        NavigationTitleBlock(title: .person) {
            VStack(spacing: .Constants.spacing) {
                content
            }
        }
    }
    
    var content: some View {
        Group {
            if heightSizeClass == .regular {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        blocks
                    }
                    .padding(16)
                }
            } else if heightSizeClass == .compact {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        blocks
                    }
                    .padding(.bottom, 45)
                    .padding(16)
                }
            } else {
                Text("Unknown")
            }
        }
    }
    
    var blocks: some View {
        Group {
            first
            first
        }
    }
    
    var first: some View {
        HStack {
            VStack {
                Rectangle()
                    .frame(height: 109)
                    .frame(width: heightSizeClass == .compact ? 230 : nil)
                HStack {
                    Rectangle()
                    Rectangle()
                }
            }
            
            Rectangle()
                .frame(width: 133)
                .frame(height: heightSizeClass == .compact ? nil : 242)
        }
    }
}

//MARK: - Extensions

private extension String {
    static var person = "Личное"
}

//MARK: - Previews

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        
        MainView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

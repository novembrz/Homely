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
        if heightSizeClass == .regular {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    content
                }
                .padding(16)
            }
        } else if heightSizeClass == .compact {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    content
                }
                .padding(.bottom, 45)
                .padding(16)
            }
        } else {
            Text("Unknown")
        }
          
    }
    
    var content: some View {
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

//MARK: - Previews

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        
        MainView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

//
//  CustomNavigationView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 24.04.2023.
//

import SwiftUI

struct CustomNavigationView<Content: View>: View {
    
    private let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


//MARK: - Previews

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView {
            VStack(spacing: 40) {
                Text("Home page")
                
                CustomNavigationLink {
                    Text("Tap")
                } destination: {
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("Destination View Controller")
                            .padding(.top, 40)
                    }
                    
                }
            }
        }
    }
}

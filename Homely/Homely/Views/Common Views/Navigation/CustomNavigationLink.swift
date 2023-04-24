//
//  CustomNavigationLink.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 24.04.2023.
//

import SwiftUI

struct CustomNavigationLink<Title: View, Destination: View>: View {
    
    private let destination: Destination
    private let title: Title?
    
    init(@ViewBuilder title: () -> Title?, @ViewBuilder destination: () -> Destination) {
        self.title = title()
        self.destination = destination()
    }
    
    var body: some View {
        NavigationLink {
            ZStack(alignment: .topLeading) {
                destination
                
                BackButton()
                    .padding(.leading, .Constants.spacing)
            }
            .navigationBarHidden(true)
        } label: {
            title
        }
    }
}

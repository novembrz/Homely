//
//  HomeView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 18.10.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .font(.bold(30))
                .padding()
        }
    }
}

//MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

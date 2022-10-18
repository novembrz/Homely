//
//  TabBarView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 18.10.2022.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: Tab = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        CurrentView()
                            .tag(tab)
                    }
                }
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
    }
    
    @ViewBuilder
    private func CurrentView() -> some View {
        switch selectedTab {
        case .home:
            HomeView()
        case .family:
            FamilyView()
        case .person:
            PersonView()
        }
    }
}

//MARK: - Previews

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}


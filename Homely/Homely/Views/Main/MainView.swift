//
//  TabBarView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 18.10.2022.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab: Tab = .home
    
    private var navigationTitle: String {
        switch selectedTab {
        case .home:
            return "Дом"
        case .family:
            return "Семья"
        case .person:
            return "Личное"
        }
    }
    
    init() {
        UITabBar.appearance().isHidden = true
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Montserrat-Bold", size: 35)!]
    }
    
    var body: some View {
        NavigationView {
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
            .navigationBarTitle(Text(navigationTitle).font(.subheadline), displayMode: .large)
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
        MainView()
    }
}


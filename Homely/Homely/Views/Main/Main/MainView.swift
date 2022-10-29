//
//  TabBarView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 18.10.2022.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: .fontName, size: .titleFontSize)!]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    TabView(selection: $viewModel.selectedTab) {
                        ForEach(Tab.allCases, id: \.rawValue) { tab in
                            CurrentView()
                                .tag(tab)
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    CustomTabBar(selectedTab: $viewModel.selectedTab)
                }
            }
            .navigationBarTitle(Text(viewModel.navigationTitle).font(.subheadline), displayMode: .large)
        }
    }
    
    //MARK: - ViewBuilder
    
    @ViewBuilder
    private func CurrentView() -> some View {
        switch viewModel.selectedTab {
        case .home:
            HomeView()
        case .family:
            FamilyView()
        case .person:
            PersonView()
        }
    }
}

//MARK: - Extensions

private extension CGFloat {
    static let titleFontSize: CGFloat = 35
}

private extension String {
    static let fontName = "Montserrat-Bold"
}

//MARK: - Previews

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


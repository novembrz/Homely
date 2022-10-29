//
//  TabBarView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 18.10.2022.
//

import SwiftUI

struct MainView: View {

    @StateObject var viewModel = MainViewModel()
    @GestureState var gestureOffset: CGFloat = 0

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        NavigationView {
            HStack(spacing: 0) {
                SideMenuView(showMenu: $viewModel.showMenu)
                
                tabBar
                    .frame(width: MainView.getRect().width)
                    .overlay(
                        sideMenuShadow
                    )
            }
            .frame(width: MainView.getRect().width + viewModel.sideBarWidth)
            .offset(x: -viewModel.sideBarWidth / 2)
            .offset(x: viewModel.offset > 0 ? viewModel.offset : 0)
            .gesture(
                DragGesture()
                    .updating($gestureOffset) { value, out, _ in
                        out = value.translation.width
                    }
                    .onEnded(viewModel.onDrugEnded(value:))
            )
        }
        .animation(.easeOut, value: viewModel.offset == 0)
        .onChange(of: viewModel.showMenu) { newValue in
            viewModel.onShowMenuChange()
        }
        .onChange(of: gestureOffset) { newValue in
            viewModel.onGestureOffsetChange(gestureOffset)
        }
    }

    //MARK: - TabBar
    
    var tabBar: some View {
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

    //MARK: - SideMenu Shadow

    var sideMenuShadow: some View {
        Rectangle()
            .fill(
                Color.primary.opacity(Double(viewModel.offset / viewModel.sideBarWidth) / 5)
            )
            .ignoresSafeArea(.container, edges: .vertical)
            .onTapGesture {
                withAnimation {
                    viewModel.showMenu.toggle()
                }
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


//
//  BaseView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 28.10.2022.
//

import SwiftUI

struct BaseView: View {
    @State var showMenu = false
    @State private var selectedTab: Tab = .home
    
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    @GestureState var gestureOffset: CGFloat = 0
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        let sideBarWidth = BaseView.getRect().width - 90
        
        NavigationView {
            HStack(spacing: 0) {
                SideMenuView(showMenu: $showMenu)
                
                VStack(spacing: 0) {
                    TabView {
                        Text("Home")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("home")
                        
                        Text("aa")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("daad")
                    }
                    
                    HStack(spacing: 0) {
                        //customtabbar
                    }
                }
                .frame(width: BaseView.getRect().width)
                .overlay(
                    Rectangle()
                        .fill(
                            Color.primary.opacity(Double(offset / sideBarWidth) / 5)
                        )
                        .ignoresSafeArea(.container, edges: .vertical)
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                )
            }
            .frame(width: BaseView.getRect().width + sideBarWidth)
            //MARK: HERE
            .offset(x: -sideBarWidth / 2)
            .offset(x: offset > 0 ? offset : 0)
            //gesture
            .gesture(
                DragGesture()
                    .updating($gestureOffset) { value, out, _ in
                        out = value.translation.width
                    }
                    .onEnded(onEnded(value:))
            )
            //nav bar
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showMenu) { newValue in
            if showMenu && offset == 0 {
                offset = sideBarWidth
                lastStoredOffset = offset
            }
            if !showMenu && offset == sideBarWidth {
                offset = 0
                lastStoredOffset = 0
            }
        }
        .onChange(of: gestureOffset) { newValue in
            onChange()
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        let sideBarWidth: CGFloat = BaseView.getRect().width - 90
        let transition = value.translation.width
        
        withAnimation {
            if transition > 0 {
                if transition > (sideBarWidth / 2) {
                    offset = sideBarWidth
                    showMenu = true
                } else {
                    if offset == sideBarWidth {
                        return
                    }
                    offset = 0
                    showMenu = false
                }
            } else {
                if -transition > (sideBarWidth / 2) {
                    offset = 0
                    showMenu = false
                } else {
                    if offset == 0 || !showMenu {
                        return
                    }
                    offset = sideBarWidth
                    showMenu = true
                }
            }
        }
        lastStoredOffset = offset
    }
    
    func onChange() {
        let sideBarWidth: CGFloat = BaseView.getRect().width - 90
        let currentOffset = gestureOffset + lastStoredOffset
//        offset = (gestureOffset != 0) ? (gestureOffset + lastStoredOffset < sideBarWidth ? gestureOffset + lastStoredOffset : offset) : offset
        
        offset = (gestureOffset != 0 && currentOffset < sideBarWidth) ? currentOffset : offset
    }
}


struct BaseViewView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}

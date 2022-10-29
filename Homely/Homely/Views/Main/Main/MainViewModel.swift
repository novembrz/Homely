//
//  MainViewModel.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 29.10.2022.
//

import SwiftUI

extension MainView {
    @MainActor class MainViewModel: ObservableObject {
        
        @Published var selectedTab: Tab = .home
        @Published var showMenu = false
        
        @Published var offset: CGFloat = 0
        @Published var lastStoredOffset: CGFloat = 0
        
        @GestureState var gestureOffset: CGFloat = 0
        
        var sideBarWidth: CGFloat { getRect().width - 90 }
        
        var navigationTitle: String {
            switch selectedTab {
            case .home:
                return "Дом"
            case .family:
                return "Семья"
            case .person:
                return "Личное"
            }
        }
        
        func onShowMenu() {
            if showMenu && offset == 0 {
                offset = sideBarWidth
                lastStoredOffset = offset
            }
            
            if !showMenu && offset == sideBarWidth {
                offset = 0
                lastStoredOffset = 0
            }
        }
        
        func onGestureOffsetChange() {
            let currentOffset = gestureOffset + lastStoredOffset
            offset = (gestureOffset != 0 && currentOffset < sideBarWidth) ? currentOffset : offset
        }
        
        func onDrugEnded(value: DragGesture.Value) {
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
    }
}

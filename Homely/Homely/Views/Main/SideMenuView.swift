//
//  SideMenuView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 28.10.2022.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var showMenu: Bool
    var menuTabs: [MenuTab] = [.accounts, .purchased, .settings, .information]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 60) {
            profileInfo //настройки аккаунта
            menu
            Spacer()
            chat
        }
        .padding(16)
        .frame(width: SideMenuView.getRect().width - 90, alignment: .leading)
        .frame(maxHeight: .infinity)
        .background(
            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
        )
    }
    
    //MARK: - Views
    
    var profileInfo: some View {
        VStack(alignment: .leading, spacing: 15) {
            Circle()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Дарья Курилова")
                    .bold(20)
                    .foregroundColor(.textColor())
                
                Text("kurilovadk@gmail.com")
                    .regular(14)
                    .foregroundColor(.textColor())
            }
        }
        .onTapGesture {
            //настройки профиля, удаления аккаунта и выйти
        }
    }
    
    var menu: some View {
        VStack(alignment: .leading, spacing: 30) {
            ForEach(menuTabs, id: \.self) { tap in
                MenuButton(text: menuTitle(tap), icon: tap.rawValue)
            }
        }
    }
    
    var chat: some View {
        VStack(alignment: .leading, spacing: 25) {
            Divider()
            MenuButton(text: "Чат с поддержкой", icon: "message")
        }
    }
    
    @ViewBuilder
    func MenuButton(text: String, icon: String) -> some View {
        Button {} label: {
            HStack(spacing: 15) {
                Image(systemName: icon)
                    .medium(19)
                    .foregroundColor(.textColor())
                
                Text(text)
                    .medium(15)
                    .foregroundColor(.textColor())
            }
        }
    }
    
    enum MenuTab: String, CaseIterable {
        case accounts = "person"
        case purchased = "creditcard" // creditcard
        case settings = "gearshape"
        case information = "info.circle"
    }
    
    private func menuTitle(_ menuTab: MenuTab) -> String {
        switch menuTab {
        case .accounts:
            return "Связанные аккаунты"
        case .purchased:
            return "Управление подпиской"
        case .settings:
            return "Настройки (opt)"
        case .information:
            return "Информация"
        }
    }
}

//MARK: - Previews

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

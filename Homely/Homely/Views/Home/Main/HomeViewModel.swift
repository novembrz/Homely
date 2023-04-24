//
//  HomeViewModel.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 21.10.2022.
//

import SwiftUI

extension HomeView {
    @MainActor class HomeViewModel: ObservableObject {
        
        var securityСameras: [SecurityСamera] = [
            SecurityСamera(roomName: "Вход", icon: "door", isOn: true),
            SecurityСamera(roomName: "Кухня", icon: "tableware", isOn: false),
            SecurityСamera(roomName: "Гостинная", icon: "livingRoom", isOn: false),
            SecurityСamera(roomName: "Спальня", icon: "bed", isOn: false),
            SecurityСamera(roomName: "Детская 1", icon: "teddyBear", isOn: false),
            SecurityСamera(roomName: "Детская 2", icon: "rattle", isOn: true),
            SecurityСamera(roomName: "Гараж", icon: "garage", isOn: false)
        ]
        
        let audioBatteryCharge = 86
        let gamepadBatteryCharge = 53
        
        
        // возможно тоже common
        func conditionerAction(_ isOn: Bool) {
            
        }
        
        // Common
        func presentView() {
            
        }
        
        func getBatteryChargeLevel(_ percent: Int) -> CGFloat {
            return CGFloat(percent)/100
        }
    }
}

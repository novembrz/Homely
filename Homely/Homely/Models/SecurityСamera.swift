//
//  SecurityСamera.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 29.10.2022.
//

import SwiftUI

struct SecurityСamera {
    var roomName: String
    var icon: String
    var isOn: Bool
}


extension SecurityСamera: Hashable {
    static func == (lhs: SecurityСamera, rhs: SecurityСamera) -> Bool {
        return lhs.roomName == rhs.roomName
    }
}

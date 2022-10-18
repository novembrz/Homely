//
//  Font + Extension.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 18.10.2022.
//

import SwiftUI

extension Font {
    
    static func light(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-Light", size: size)
    }
    
    static func regular(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-Regular", size: size)
    }
    
    static func medium(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-Medium", size: size)
    }
    
    static func bold(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-Bold", size: size)
    }
}

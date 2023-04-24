//
//  Font + Extension.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 18.10.2022.
//

import SwiftUI

public struct ThemedFont: ViewModifier {
    
    enum ThemeFont: String {
        case bold = "Montserrat-Bold"
        case medium = "Montserrat-Medium"
        case regular = "Montserrat-Regular"
        case light = "Montserrat-Light"
    }
    
    var size: CGFloat
    var font: ThemeFont = .regular
    
    public func body(content: Content) -> some View {
        content
            .font(Font(UIFont(name: font.rawValue, size: size)!))
    }
}

extension View {
    
    public func bold(_ size: CGFloat) -> some View {
        self.modifier(ThemedFont(size: size, font: .bold))
    }
    
    public func medium(_ size: CGFloat) -> some View {
        self.modifier(ThemedFont(size: size, font: .medium))
    }
    
    public func regular(_ size: CGFloat) -> some View {
        self.modifier(ThemedFont(size: size, font: .regular))
    }
    
    public func light(_ size: CGFloat) -> some View {
        self.modifier(ThemedFont(size: size, font: .light))
    }
}

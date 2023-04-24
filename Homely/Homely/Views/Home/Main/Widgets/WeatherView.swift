//
//  WeatherView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 22.10.2022.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack {
                VStack(alignment: .leading, spacing: .inHomeInfoSpacing) {
                    inHomeInfoView(title: "24°", subtitle: .home)
                    inHomeInfoView(title: "74%", subtitle: .humidity)
                }
                
                Spacer()
                
                VStack {
                    Spacer()
                    
                    HStack(spacing: .wheaterInfoSpacing) {
                        wheaterInfoView(temp: "12°", icon: .Icon.sun())
                        wheaterInfoView(temp: "5°", icon: .Icon.moon())
                    }
                }
            }
            .padding(.vertical, .verticalPadding)
            .padding(.horizontal, .horizontalPadding)
            .frame(height: .heigth)
            .background(Color.elementColor())
            .cornerRadius(.Constants.cornerRadius)
            
            Image.Illustration.sun()
                .cornerRadius(.Constants.cornerRadius)
        }
    }
    
    //MARK: - infoView
    
    @ViewBuilder
    func inHomeInfoView(title: String, subtitle: String) -> some View {
        VStack(alignment: .leading, spacing: -2) {
            Text(title)
                .bold(.titleSize)
                .foregroundColor(.textColor())
            
            Text(subtitle)
                .regular(.subtitleSize)
                .foregroundColor(.textColor())
        }
    }
    
    //MARK: - infoView
    
    @ViewBuilder
    func wheaterInfoView(temp: String, icon: Image) -> some View {
        HStack(spacing: .wheaterItemSpacing) {
            icon
                .resizable()
                .frame(width: .iconSize, height: .iconSize)
                .foregroundColor(.textColor())
            
            Text(temp)
                .bold(.wheaterTextSize)
                .foregroundColor(.textColor())
        }
    }
}

//MARK: - Extensions

private extension String {
    static var home = "в доме"
    static var humidity = "влажность"
}

private extension CGFloat {
    static var verticalPadding: CGFloat = 16
    static var horizontalPadding: CGFloat = 14
    static var width: CGFloat = 198
    static var heigth: CGFloat = 109
    static var inHomeInfoSpacing: CGFloat = 12
    static var wheaterInfoSpacing: CGFloat = 11
    static var wheaterItemSpacing: CGFloat = 2
    static var iconSize: CGFloat = 13
    static var wheaterTextSize: CGFloat = 13
    static var titleSize: CGFloat = 18
    static var subtitleSize: CGFloat = 12
}

//MARK: - Previews

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

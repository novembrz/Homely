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
                VStack(alignment: .leading, spacing: 12) {
                    inHomeInfoView(title: "24°", subtitle: "в доме")
                    inHomeInfoView(title: "74%", subtitle: "влажность")
                }
                
                Spacer()
                
                VStack {
                    Spacer()
                    
                    HStack(spacing: 11) {
                        wheaterInfoView(temp: "12°", icon: .Icon.sun())
                        wheaterInfoView(temp: "5°", icon: .Icon.moon())
                    }
                }
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 14)
            .frame(width: 198, height: 109)
            .background(Color.backgroundColor())
            .cornerRadius(.CommonSize.cornerRadius)
            
            Image.Illustration.sun()
                .cornerRadius(.CommonSize.cornerRadius)
        }
    }
    
    //MARK: - infoView
    
    @ViewBuilder
    func inHomeInfoView(title: String, subtitle: String) -> some View {
        VStack(alignment: .leading, spacing: -2) {
            Text(title)
                .font(.bold(18))
                .foregroundColor(.textColor())
            
            Text(subtitle)
                .font(.regular(12))
                .foregroundColor(.textColor())
        }
    }
    
    //MARK: - infoView
    
    @ViewBuilder
    func wheaterInfoView(temp: String, icon: Image) -> some View {
        HStack(spacing: 2) {
            icon
                .resizable()
                .frame(width: 13, height: 13)
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(.textColor())
            
            Text(temp)
                .font(.bold(13))
                .foregroundColor(.textColor())
        }
    }
}

//MARK: - Extensions

private extension CGFloat {
    
}

//MARK: - Previews

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

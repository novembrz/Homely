//
//  CarView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 25.04.2023.
//

import SwiftUI

struct CarView: View {
    
    @State private var isOn: Bool = false
    
    var tint: Color
    var completion: ((Bool) -> ())
    
    private var icon: Image { isOn ? Image.Illustration.lightOn() : Image.Illustration.lightOff()}
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image.Illustration.car()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 117)
            
            VStack(spacing: 21) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(String.car)
                            .regular(.carTextSize)
                            .foregroundColor(.textColor())
                        
                        Text(String.carModel)
                            .bold(.carModelTextSize)
                            .foregroundColor(.textColor())
                    }
                    
                    Toggle("", isOn: $isOn)
                        .labelsHidden()
                        .tint(tint)
                }
                
                HStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: .infoSpacing) {
                        HorizontalIconTitleView(
                            text: .litr,
                            icon: .Icon.petrol(),
                            iconSize: .iconSize,
                            textSize: .infoTextSize
                        )
                        
                        HorizontalIconTitleView(
                            text: .km,
                            icon: .Icon.highway(),
                            iconSize: .iconSize,
                            textSize: .infoTextSize
                        )
                        
                        Spacer()
                    }
                }
            }
            .padding(14)
        }
        .frame(width: 198)
       
        .background(Color.elementColor())
        .cornerRadius(.Constants.cornerRadius)
    }
}

//MARK: - Extensions

private extension String {
    static var car = "Автомобиль"
    static var carModel = "Lexus LC 500"
    static var km = "96к км"
    static var litr = "54л"
}

private extension CGFloat {
    static let iconSize: CGFloat = 14
    static let carTextSize: CGFloat = 12
    static let carModelTextSize: CGFloat = 16
    static let infoTextSize: CGFloat = 10
    static let infoSpacing: CGFloat = 11
}

//MARK: - Previews

struct CarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CarView(tint: .homeColor()) { _ in}
        }
    }
}

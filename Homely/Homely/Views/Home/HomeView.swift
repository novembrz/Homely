//
//  HomeView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 20.10.2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationBlock(title: .home) {
            VStack(spacing: .Constants.spacing) {
                firstRow
                secondRow
            }
        }
    }

    //MARK: - firstRow

    var firstRow: some View {
        HStack(spacing: .Constants.spacing) {
            VStack(spacing: .Constants.spacing) {
                WeatherView()
                
                HStack(spacing: .Constants.spacing) {
                    IconTitleToggleView(
                        title: .conditioner,
                        icon: .Icon.fan(),
                        tint: .homeColor()) { action in
                            viewModel.conditionerAction(action)
                        }
                    
                    IconTitleToggleView(
                        title: .humidifier,
                        icon: .Icon.drop(),
                        tint: .homeColor()) { action in
                            viewModel.conditionerAction(action)
                        }
                }
            }
            
            LightView { action in
                viewModel.conditionerAction(action)
            }
        }
    }

    //MARK: - secondRow
    
    var secondRow: some View {
        VStack(alignment: .leading, spacing: 11) {
            Text(String.securityCameras)
                .font(.regular(15))
                .foregroundColor(.textColor())
            
            HStack(spacing: 11) {
                ForEach(viewModel.securityСameras, id: \.self) { camera in
                    ChooseButton(icon: .getImage(camera.icon),
                                 tint: .homeColor()) { isActive in
                        viewModel.securityСamerasAction(isActive, camera: camera)
                    }
                }
                
                Spacer()
            }
        }
        .padding(14)
        .background(Color.elementColor())
        
        .cornerRadius(.Constants.cornerRadius)
    }

}

//MARK: - Extensions

private extension String {
    static var home = "Дом"
    static var conditioner = "Кондиционер"
    static var humidifier = "Увлажнитель"
    static var securityCameras = "Камеры видеонаблюдения"
}

//MARK: - Previews

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
            MainView()
                .preferredColorScheme(.dark)
        }
    }
}

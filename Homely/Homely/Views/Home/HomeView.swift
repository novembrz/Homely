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
            }
        }
    }

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
}

//MARK: - Extensions

private extension String {
    static var home = "Дом"
    static var conditioner = "Кондиционер"
    static var humidifier = "Увлажнитель"
}

//MARK: - Previews

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

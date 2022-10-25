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
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: .CommonSize.spacing) {
                firstRow
            }
            .padding(.horizontal, .CommonSize.spacing)
        }
    }

    var firstRow: some View {
        HStack(spacing: .CommonSize.spacing) {
            VStack(spacing: .CommonSize.spacing) {
                WeatherView()
                
                HStack(spacing: .CommonSize.spacing) {
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
    static var conditioner = "Кондиционер"
    static var humidifier = "Увлажнитель"
}

//MARK: - Previews

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

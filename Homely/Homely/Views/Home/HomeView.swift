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
            VStack {
                firstRow
            }
        }
    }

    var firstRow: some View {
        HStack {
            VStack {
                WeatherView()
                
                HStack {
                    IconTitleToggleView(
                        title: "Кондиционер",
                        icon: .Icon.fan(),
                        tint: .homeColor()) { action in
                            viewModel.conditionerAction(action)
                        }
                    
                    IconTitleToggleView(
                        title: "Увлажнитель",
                        icon: .Icon.drop(),
                        tint: .homeColor()) { action in
                            viewModel.conditionerAction(action)
                        }
                }
            }
            
            //LightView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

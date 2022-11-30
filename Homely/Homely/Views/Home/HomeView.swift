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
                firstBlock
                SecurityCamerasView(cameras: viewModel.securityСameras)
                secondBlock
            }
        }
    }

    //MARK: - firstRow

    var firstBlock: some View {
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
    
    
    //MARK: - secondBlock

    var secondBlock: some View {
        HStack {
            VerticalTitleToggle(
                title: "Smart TV",
                textSize: .textSize,
                tint: .homeColor()) { action in
                    
                }
                .padding(.top, .topPadding)
                .padding(.leading, .leadingPadding)
                .padding(.trailing, .tvTrailingPadding)
                .padding(.bottom, .bottomPadding)
                .background(Color.elementColor())
                .cornerRadius(.Constants.cornerRadius)
            
            playStationSystem
        }
    }
    
    var playStationSystem: some View {
        HStack {
            VerticalTitleToggle(
                title: "PlayStation",
                textSize: .textSize,
                tint: .homeColor()) { action in
                    
                }
            
            Spacer()
            
            HStack(spacing: 20) {
                percentView(icon: .Icon.gamepad(), percent: viewModel.gamepadBatteryCharge)
                percentView(icon: .Icon.subwoofer(), percent: viewModel.audioBatteryCharge)
            }
        }
        .padding(.top, .topPadding)
        .padding(.leading, .leadingPadding)
        .padding(.trailing, .playstationTrailingPadding)
        .padding(.bottom, .bottomPadding)
        .background(Color.elementColor())
        .cornerRadius(.Constants.cornerRadius)
    }
    
    @ViewBuilder
    func percentView(icon: Image, percent: Int) -> some View {
        VStack(spacing: 4) {
            ZStack {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.backgroundColor())
                    .frame(width: .circleSize, height: .circleSize)
                
                Circle()
                    .trim(from: 0.0, to: viewModel.getBatteryChargeLevel(percent))
                    .rotation(Angle(radians: 4.7))
                    .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.homeColor())
                    .frame(width: .circleSize, height: .circleSize)
                
                icon
                    .resizable()
                    .frame(width: .circleIconSize, height: .circleIconSize)
                    .foregroundColor(.textColor())
            }
            
            Text("\(percent)%")
                .font(.medium(13))
                .foregroundColor(.textColor())
        }
    }
}

//MARK: - Extensions

private extension String {
    static var home = "Дом"
    static var conditioner = "Кондиционер"
    static var humidifier = "Увлажнитель"
    static var securityCameras = "Камеры видеонаблюдения"
}

private extension CGFloat {
    static var textSize: CGFloat = 14
    static var topPadding: CGFloat = 11
    static var leadingPadding: CGFloat = 10
    static var tvTrailingPadding: CGFloat = 30
    static var playstationTrailingPadding: CGFloat = 7
    static var bottomPadding: CGFloat = 14
    static var circleSize: CGFloat = 41
    static var circleIconSize: CGFloat = 18
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

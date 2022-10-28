//
//  LightView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 25.10.2022.
//

import SwiftUI

struct LightView: View {
    @State private var isOn: Bool = false
    
    private var icon: Image { isOn ? Image.Illustration.lightOn() : Image.Illustration.lightOff()}
    
    var completion: ((Bool) -> ())
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Spacer()
                
                VerticalTitleToggle(
                    title: .title,
                    textSize: .textSize,
                    tint: .homeColor()) { isOn in
                        self.isOn = isOn
                        completion(isOn)
                    }
            }
            .padding(.padding)
            .frame(width: .width, height: .heigth, alignment: .leading)
            .background(Color.backgroundColor())
            .cornerRadius(.Constants.cornerRadius)
            
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .imageSize)
        }
    }
}

//MARK: - Extensions

private extension String {
    static var title = "Свет в доме"
}

private extension CGFloat {
    static var imageSize: CGFloat = 92
    static var textSize: CGFloat = 14
    static var padding: CGFloat = 14
    static var width: CGFloat = 133
    static var heigth: CGFloat = 242
}

//MARK: - Previews

struct LightView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LightView() { _ in}
        }
    }
}

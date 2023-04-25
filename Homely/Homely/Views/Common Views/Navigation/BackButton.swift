//
//  BackButton.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 24.04.2023.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            withAnimation {
                dismiss()
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 11)
                    .frame(width: 43, height: 43)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.25), radius: 15, x: 4, y: 4)
                
                Image(systemName: "chevron.left")
                    .foregroundColor(.textColor())
                    .font(.system(size: 14, weight: .bold))
            }
        }
        .padding(.top, .Constants.spacing)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
            .background(Color.backgroundColor())
    }
}

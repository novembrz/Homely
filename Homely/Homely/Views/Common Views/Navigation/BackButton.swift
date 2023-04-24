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
                    .foregroundColor(.elementColor())
                    .shadow(color: .gray.opacity(0.4), radius: 15, x: 2, y: 2)
                
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

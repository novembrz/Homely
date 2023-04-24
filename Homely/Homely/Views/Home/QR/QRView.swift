//
//  QRView.swift
//  Homely
//
//  Created by Kurilova Daria Kirillovna on 24.04.2023.
//

import SwiftUI

struct QRView: View {
    
    @StateObject var viewModel = QRViewModel()
    
    var body: some View {
        VStack {
            Text("Отсканируйте QR продукта и вам придет уведомление о том, когда закончится скрок годности!")
                .bold(14)
            
            Text("По истечению скрока годности, ваши избранные товары добавятся в список покупок автоматически!")
        }
        .padding(.Constants.spacing)
    }
}

struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView()
    }
}

//
// Created by Илья Разработчик on 16.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage
import ExyteGrid


struct OfferView: View {
    let text: String
    var tags = ["Ежи", "Грызуны", "Птицы", "Рептилии","Рыбы","Млекопитающие"]
    @State var selection: Int? = nil

    let url: URL

    let price: Float
    let basePrice: Float

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                HStack {
                    URLImage(self.url, content: { image in
                        image.image.centerCropped()
                    }).frame(height: 180)
                            .cornerRadius(10)
                    ItemView(text: self.text, price: self.price, basePrice: self.basePrice)
                }

                VStack(alignment: .leading) {
                    Text("Подходит для").font(.title)
                }
                Text("Здесь будут тэги").padding()
                DropDownView(text: self.text, title: "Описание")
                DropDownView(text: self.text, title: "Преимущества")
            }
                    .gridContentMode(.scroll)
                    .gridPacking(.dense)
                    .gridFlow(.rows)
        }
    }

}

struct OfferView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

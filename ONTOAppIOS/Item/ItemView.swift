//
// Created by Илья Разработчик on 16.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage

struct OfferView: View {
    let text: String
    var tags = ["Ежи", "Грызуны", "Птицы", "Рептилии","Рыбы","Млекопитающие"]
    @State var selection: Int? = nil

    let url: URL

    let price: Float
    let basePrice: Float

    var body: some View {
        VStack(alignment: .leading) {
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
            TagCloudView(tags: tags, tagBackgroundColor: .tagBackgroundColor, tagTextColor: .tagTextColor, tagRadius: 15)
            /*Grid(tracks: 5) {
                ForEach(0..<self.tags.count) { i in
                    Text(tags[i])
                            .background(Color.green.opacity(0.5))
                    .cornerRadius(10)

                }
            }
                    .gridContentMode(.scroll)
                    .gridPacking(.dense)
                    .gridFlow(.rows)*/
            
        }
    }
}

struct OfferView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

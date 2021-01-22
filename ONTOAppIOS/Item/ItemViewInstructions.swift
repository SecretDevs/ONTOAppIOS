//
// Created by Илья Разработчик on 18.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

import SwiftUI
import URLImage

struct ItemViewInstructions: View {
    let text: String

    let instructions = [15, 9, 0.4, 185]

    let price: Float
    let basePrice: Float

    var body: some View {
        VStack(alignment: .leading) {
            Text(self.text).font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .layoutPriority(.greatestFiniteMagnitude)


            ForEach(0..<self.instructions.count) { i in
                HStack {
                    Text("Белки").font(.subheadline).accentColor(Color.gray)
                    Spacer()
                    Text("\(self.instructions[i], specifier: "%.2f")").font(.subheadline).accentColor(Color.gray)
                }.padding(2)
            }
            Divider()
            HStack {
                Text("Цена").font(.subheadline).accentColor(Color.gray)
                Spacer()
                Text("\(self.price, specifier: "%.0f") ₽").font(.system(size: 20))
                .fontWeight(.bold)
            }.padding(2)
                    .padding(.top, 5)
        }.padding(.leading, 10)
                .padding(.trailing)
    }
}


struct ItemViewInstructions_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
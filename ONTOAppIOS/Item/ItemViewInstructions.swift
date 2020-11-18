//
// Created by Илья Разработчик on 18.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

import SwiftUI
import URLImage

struct ItemView: View {
    let text: String

    let instructions = [15, 9, 0.4, 185]

    let price: Float
    let basePrice: Float

    var body: some View {
        VStack {
            Text(self.text)
                    .foregroundColor(.black)
                    .layoutPriority(.greatestFiniteMagnitude)


            ForEach(0..<self.instructions.count) { i in
                HStack {
                    Text("Белки").font(.subheadline)
                    Spacer()
                    Text("\(self.instructions[i], specifier: "%.2f")").font(.subheadline)
                }.padding(2)
            }

            HStack {
                Text("Цена").font(.subheadline)
                Spacer()
                Text("\(self.instructions[3], specifier: "%.0f")").font(.body)
            }.padding(2)
                    .padding(.top, 5)
        }.padding(.leading, 10)
                .padding(.trailing)
    }
}


struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
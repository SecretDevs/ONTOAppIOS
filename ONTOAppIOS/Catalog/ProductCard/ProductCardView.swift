//
// Created by Илья Разработчик on 28.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation


//
// Created by Илья Разработчик on 16.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//


import Foundation
import SwiftUI
import URLImage

struct ProductCardView: View {
    let text: String
    let url: URL
    let price: Float


    var body: some View {
        VStack(alignment: .center) {
            URLImage(self.url, content: {image in
                image.image.centerCropped()
            }).frame(height: 180)
                    .cornerRadius(10)

            VStack(alignment: .leading) {
                HStack {
                    Text(self.text)
                            .foregroundColor(.black)
                            .layoutPriority(.greatestFiniteMagnitude)
                            .font(.system(size: 15))
                            .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                Spacer()
                }.padding(.leading, 12)
                        .padding(.trailing,5)
                    .frame(height: 70)





            VStack(alignment: .leading) {
                HStack {
                    Text("\(self.price, specifier: "%.0f") ₽").fontWeight(.bold)
                            .foregroundColor(.black)
                            .layoutPriority(.greatestFiniteMagnitude)
                            .font(.system(size: 20))
                    Spacer()
                }
            }.padding(.all, 5)
                    .padding(.bottom)
                    .padding(.leading,10)
                    .frame(height: 40)

        }.frame(width: 168,height: 290, alignment: .top)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(5)
    }
}


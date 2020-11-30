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
                Text(self.text)
                        .foregroundColor(.black)
                        .layoutPriority(.greatestFiniteMagnitude)
            }.padding(.leading,10)
                    .padding(.trailing)
            HStack{

                HStack {
                    Text("\(self.price, specifier: "%.0f")").fontWeight(.bold)
                            .foregroundColor(.red)
                            .layoutPriority(.greatestFiniteMagnitude)
                            .font(.system(size: 20))
                }
                        .padding(.all,5)
                        .padding(.bottom,10)
                        .padding(.leading)

                Spacer()
                VStack(alignment: .trailing) {
                    Button(action: {
                        //TODO
                    }) {
                        HStack {
                            Image("item_plus_button").resizable().aspectRatio(contentMode: .fit)
                        }.frame(width: 30)
                    }.padding(5)
                }

            }

        }.frame(alignment: .top)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(5)
    }
}


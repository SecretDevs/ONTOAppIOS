//
// Created by Илья Разработчик on 16.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//


import Foundation
import SwiftUI
import URLImage

struct OfferCardView: View {
    let text: String

    let url: URL

    let price: Float
    let basePrice: Float


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
                    Text("\(self.basePrice, specifier: "%.0f")")
                            .foregroundColor(.gray)
                            .layoutPriority(.greatestFiniteMagnitude)
                            .font(.system(size: 15))
                }
                        .padding(.all,5)
                        .padding(.bottom,10)
                        .padding(.leading)

                Spacer()
                VStack(alignment: .trailing) {
                    Button(action: {
                        //TODO
                    }) {
                        Text(" + ").font(.system(size: 20))
                                .foregroundColor(.white)
                                .background(Color.green)
                                .cornerRadius(10)
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

struct OfferCardView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

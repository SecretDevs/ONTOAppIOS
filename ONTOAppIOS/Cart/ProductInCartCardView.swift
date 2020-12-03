//
// Created by Ivanov Ivan on 01.12.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage

struct ProductInCartCardView: View {
    let text: String
    let url: URL
    let price: Float
    let count: Int


    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            URLImage(self.url, content: {image in
                image.image.centerCropped()
            })
                    .frame(maxWidth: 90,maxHeight: 90)
                    .cornerRadius(10)
                    .padding([.top, .bottom], 10)

            Spacer()

            VStack(alignment: .leading) {
                Text(self.text)
                        .foregroundColor(.black)
                        .layoutPriority(.greatestFiniteMagnitude)
                HStack{
                    Button(action: {
                        //self.cartViewModel.addProductToCart(product: self.viewModel.products[i])
                    }) {
                        HStack {
                            if #available(iOS 14.0, *){
                                Image("ic_cart_minus_svg").resizable().aspectRatio(contentMode: .fit)
                            }else{
                                Image("ic_cart_minus_png").resizable().aspectRatio(contentMode: .fit)
                            }
                        }.frame(width: 30)
                    }.padding(20)
                    Spacer()
                    Text("\(count)")
                    Spacer()
                    Button(action: {
                        //self.cartViewModel.addProductToCart(product: self.viewModel.products[i])
                    }) {
                        HStack {
                            if #available(iOS 14.0, *){
                                Image("ic_cart_plus_svg").resizable().aspectRatio(contentMode: .fit)
                            }else{
                                Image("ic_cart_plus_png").resizable().aspectRatio(contentMode: .fit)
                            }
                        }.frame(width: 30)
                    }.padding(20)
                }
            }
                    .padding(.top, 10)
            VStack{
                Button(action: {
                    //self.cartViewModel.deleteProductFromCart(productIndex: i)
                }) {
                    HStack {
                        if #available(iOS 14.0, *){
                            Image("ic_cart_cross_svg").resizable().aspectRatio(contentMode: .fit)
                        }else{
                            Image("ic_cart_cross_png").resizable().aspectRatio(contentMode: .fit)
                        }
                    }.frame(width: 30)
                }.padding(20)

                Spacer()

                HStack {
                    Text("\(self.price, specifier: "%.0f") ₽")
                            .fontWeight(.bold)
                            .layoutPriority(.greatestFiniteMagnitude)
                            .font(.system(size: 20))
                }

            }

        }
                .background(Color.white)
    }
}
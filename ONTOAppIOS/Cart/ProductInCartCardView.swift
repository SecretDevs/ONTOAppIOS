//
// Created by Ivanov Ivan on 01.12.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage

struct ProductInCartCardView: View {
    let productInCart: ProductInCart
    @EnvironmentObject var cartViewModel : ViewRouter

    var body: some View {
        HStack(alignment: .top) {

            URLImage(URL(string: self.productInCart.product.image)!, content: {image in
                image.image.centerCropped()
            })
                    .frame(width: 110, height: 110)
                    .cornerRadius(10)
                    .padding([.top, .bottom], 10)

            VStack(alignment: .leading) {
                Text(self.productInCart.product.name)
                        .foregroundColor(.black)
                        .layoutPriority(.greatestFiniteMagnitude)
                Spacer()
                HStack{
                    Button(action: {
                        self.cartViewModel.decreaseProductCount(product: self.productInCart.product)
                    }) {
                        HStack {
                            if #available(iOS 14.0, *){
                                Image("ic_cart_minus_svg").resizable().aspectRatio(contentMode: .fit)
                            }else{
                                Image("ic_cart_minus_png").resizable().aspectRatio(contentMode: .fit)
                            }
                        }.frame(width: 40)
                    }
                    Spacer()
                    Text("\(self.productInCart.count)").font(.system(size: 18))
                            .fontWeight(.bold).foregroundColor(Color.black)
                    Spacer()
                    Button(action: {
                        self.cartViewModel.increaseProductCount(product: self.productInCart.product)
                    }) {
                        HStack {
                            if #available(iOS 14.0, *){
                                Image("ic_cart_plus_svg").resizable().aspectRatio(contentMode: .fit)
                            }else{
                                Image("ic_cart_plus_png").resizable().aspectRatio(contentMode: .fit)
                            }
                        }.frame(width: 40)
                    }
                }.frame(maxWidth: 120)
                        .padding(.bottom,10)
            }.frame(minWidth: 140)
                    .padding(.horizontal, 10)
                    .padding(.top,10)

            Spacer()
            VStack(alignment: .trailing){
                Button(action: {
                    self.cartViewModel.deleteProductFromCart(product: productInCart.product)
                }) {
                    HStack {
                        if #available(iOS 14.0, *){
                            Image("ic_cart_cross_svg").resizable().aspectRatio(contentMode: .fit)
                        }else{
                            Image("ic_cart_cross_png").resizable().aspectRatio(contentMode: .fit)
                        }
                    }.frame(width: 22)
                }.padding([.top, .bottom], 10)

                Spacer()

                HStack {
                    Text("\(self.productInCart.product.price, specifier: "%.0f") ₽")
                            .fontWeight(.bold)
                            .layoutPriority(.greatestFiniteMagnitude)
                            .font(.system(size: 20))
                            .padding([.top, .bottom], 20)
                }

            }

        }
                .background(Color.white)
    }
}
//
// Created by Ivanov Ivan on 01.12.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

import SwiftUI
import os

struct CartView: View {

    @EnvironmentObject var viewModel : ViewRouter

    var body: some View {
        if (viewModel.selectedProducts.isEmpty){
            VStack{
                if #available(iOS 14.0, *){
                    Image("background_empty_cart_svg").resizable().aspectRatio(contentMode: .fit).frame(maxWidth: 300).padding(.bottom, 30)
                }else{
                    Image("background_empty_cart_png").resizable().aspectRatio(contentMode: .fit).frame(maxWidth: 300).padding(.bottom, 30)
                }
                Text("Корзина пуста").font(.system(size: 20)).fontWeight(.bold).padding(.bottom, 20)
                if #available(iOS 14.0, *){
                    Image("ic_down_arrow_svg").resizable().aspectRatio(contentMode: .fit).frame(maxHeight: 16).padding(.bottom, 20)
                }else{
                    Image("ic_down_arrow_png").resizable().aspectRatio(contentMode: .fit).frame(maxHeight: 16).padding(.bottom, 20)
                }
                NavigationLink(destination: CatalogView()){
                    Text("ПЕРЕЙТИ В КАТАЛОГ")
                            .padding([.top, .bottom], 16)
                            .padding([.leading, .trailing], 65)
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [.buttonStartColor, .buttonEndColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(12.0)
                            .shadow(color: .buttonShadowColor, radius: 9, y: 3)
                }
            }.navigationBarTitle("Корзина")
        }else{
            List(self.viewModel.selectedProducts) { productInCart in
                ProductInCartCardView(productInCart: productInCart)
            }
                    .buttonStyle(PlainButtonStyle())
                    .navigationBarTitle("Корзина")
        }
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView().environmentObject(ViewRouter())
    }
}
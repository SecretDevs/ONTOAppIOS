//
// Created by Ivanov Ivan on 01.12.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

import SwiftUI
import os

struct CartView: View {

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Binding var tabViewTag : Int
    @State private var tabBar: UITabBar?
    @State var navBarHidden: Bool = false
    @EnvironmentObject var viewModel : ViewRouter
    @State var isActive: Bool = false
    @State var selectedProductInCart: ProductInCart? = nil

    var body: some View {
        if (viewModel.selectedProducts.isEmpty){
            VStack{
                if #available(iOS 14.0, *){
                    Image("background_empty_cart_svg").resizable().aspectRatio(contentMode: .fit).frame(maxWidth: 300).padding(.bottom, 50)
                }else{
                    Image("background_empty_cart_png").resizable().aspectRatio(contentMode: .fit).frame(maxWidth: 300).padding(.bottom, 50)
                }
                Text("Корзина пуста").font(.system(size: 20)).fontWeight(.bold).padding(.bottom, 20)
                if #available(iOS 14.0, *){
                    Image("ic_down_arrow_svg").resizable().aspectRatio(contentMode: .fit).frame(maxHeight: 16).padding(.bottom, 20)
                }else{
                    Image("ic_down_arrow_png").resizable().aspectRatio(contentMode: .fit).frame(maxHeight: 16).padding(.bottom, 20)
                }
                Button(action: {
                    self.mode.wrappedValue.dismiss()
                    self.tabViewTag = 2
                }) {
                    Text("ПЕРЕЙТИ В КАТАЛОГ")
                            .padding([.top, .bottom], 16)
                            .padding([.leading, .trailing], 65)
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [.buttonStartColor, .buttonEndColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(12.0)
                            .shadow(color: .buttonShadowColor, radius: 9, y: 3)
                }
            }
                    .navigationBarTitle("Корзина")
                    .introspectTabBarController{ controller in
                        self.tabBar = controller.tabBar
                        self.tabBar?.isHidden = true
                    }
                    .onDisappear{
                        self.tabBar?.isHidden = false
                    }
        }else{
            NavigationView{
                VStack{
                    VStack {
                        if selectedProductInCart != nil{
                            NavigationLink(destination: ItemView(shouldPopToRootView: self.$isActive, navBarHidden: self.$navBarHidden, id: selectedProductInCart!.product.id), isActive: self.$isActive) {
                                Text("Empty.")
                            }.isDetailLink(false)
                        }
                    }.hidden()
                    List(self.viewModel.selectedProducts) { productInCart in
                        Button(action: {
                            self.selectedProductInCart = productInCart
                            self.navBarHidden = true
                            self.isActive = true
                        }, label: {
                            ProductInCartCardView(productInCart: productInCart)
                        }).buttonStyle(PlainButtonStyle())
                    }
                            .listStyle(PlainListStyle())
                            .buttonStyle(PlainButtonStyle())
                }.navigationBarHidden(true)
            }
                    .navigationBarHidden(self.navBarHidden)
                    .navigationBarTitle("Корзина")
                    .introspectTabBarController{ controller in
                        self.tabBar = controller.tabBar
                        self.tabBar?.isHidden = true
                    }
                    .onDisappear{
                        self.tabBar?.isHidden = false
                    }
        }
    }
}
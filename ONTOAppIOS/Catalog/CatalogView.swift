//
// Created by Илья Разработчик on 28.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import ExyteGrid
import os


struct CatalogView: View {


    @State var selected = ""
    @ObservedObject var viewModel = CatalogViewModel()
    @EnvironmentObject var cartViewModel : ViewRouter
    @State var isActive: Bool = false
    var tags = ["Кошка", "Собака", "Грызун", "Мышь", "Крыса", "Хомяк", "Дегу"]

    var body: some View {


        NavigationView {

            VStack(alignment: .leading) {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<self.tags.count) { i in
                                Button(action: {
                                    self.selected = tags[i]
                                }) {
                                    Text(tags[i])
                                            .padding(.all, 5)
                                            .font(.body)
                                            .background(
                                                    (self.selected != "") && (self.selected == tags[i]) ? Color.green : Color.green.opacity(0.3))
                                            .foregroundColor(
                                                    (self.selected != "") && (self.selected == tags[i]) ? Color.white
                                                            : Color.green)
                                            .cornerRadius(10)
                                }
                            }

                        }
                    }
                }
                        .frame(height: 100)
                        .padding(.horizontal, 10)


                Grid(tracks: 2) {
                    ForEach(0..<self.viewModel.products.count) { i in
                        let productCard = ProductCardView(text: self.viewModel.products[i].name, url: URL(string: self.viewModel.products[i].image)!, price: self.viewModel.products[i].price)
                        ZStack(alignment: .bottomTrailing){
                            NavigationLink(destination: ItemView(shouldPopToRootView: self.$isActive, text: self.viewModel.products[i].name, url: URL(string: self.viewModel.products[i].image)!, price: self.viewModel.products[i].price, basePrice: 150.0, description: self.viewModel.products[i].description), isActive: self.$isActive) {
                                productCard.gridSpan(column: 1)
                            }.isDetailLink(false)
                            Button(action: {
                                self.cartViewModel.addProductToCart(product: self.viewModel.products[i])
                            }) {
                                HStack {
                                    Image("item_plus_button").resizable().aspectRatio(contentMode: .fit)
                                }.frame(width: 37)
                            }
                            .padding(.leading, 20)
                            .padding(.trailing, 12)
                            .padding(.bottom,12)
                        }
                    }

                }.gridContentMode(.scroll)
                        .gridPacking(.dense)
                        .gridFlow(.rows)
                        .navigationBarTitle("Каталог", displayMode: .large)
                        /*.navigationBarItems(trailing:
                        HStack(alignment: .center) {
                            Text("Корзина")
                        })*/
            }
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView().environmentObject(ViewRouter())
    }
}



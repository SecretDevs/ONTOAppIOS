//
// Created by Илья Разработчик on 28.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import ExyteGrid


struct CatalogView: View {

    @State var selected = ""
    @ObservedObject var viewModel = CatalogViewModel()
    @ObservedObject var cartViewModel = CartViewModel()
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
                            NavigationLink(destination: ItemView(shouldPopToRootView: self.$isActive, text: "Offer", url: URL(string: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg")!, price: self.viewModel.products[i].price, basePrice: 150.0), isActive: self.$isActive) {
                                productCard.gridSpan(column: 1)
                            }.isDetailLink(false)
                            Button(action: {
                                cartViewModel.addProductToCart(product: self.viewModel.products[i])
                            }) {
                                HStack {
                                    Image("item_plus_button").resizable().aspectRatio(contentMode: .fit)
                                }.frame(width: 30)
                            }.padding(5)
                        }
                    }
                    ProductCardView(text: "Offer1", url: URL(string: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg")!, price: 100.0)
                            .gridSpan(column: 1)
                    ProductCardView(text: "Offer2", url: URL(string: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg")!, price: 100.0)
                            .gridSpan(column: 1)

                }.gridContentMode(.scroll)
                        .gridPacking(.dense)
                        .gridFlow(.rows)
                        .navigationBarTitle("Каталог")
                        .navigationBarItems(trailing:
                        HStack(alignment: .center) {
                            Text("Корзина")
                        })
            }
        }
    }
}



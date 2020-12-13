//
// Created by Илья Разработчик on 28.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import ExyteGrid
import os
import SwiftUIPager


struct CatalogView: View {

    @Binding var tabViewTag : Int
    @State var selected = ""
    @State var pageIndex = 0
    @ObservedObject var viewModel = CatalogViewModel()
    @EnvironmentObject var cartViewModel : ViewRouter
    @State var isActive: Bool = false
    var tags = ["Кошка", "Собака", "Грызун", "Мышь", "Крыса", "Хомяк", "Дегу"]
    var offers_png = ["offer1_png", "offer1_png", "offer1_png"]
    var offers_svg = ["offer1_svg", "offer1_svg", "offer1_svg"]
    var indexes: [Int]  = [0, 1, 2]

    var body: some View {

        NavigationView {
            VStack(alignment: .leading) {
                VStack{
                    Pager(page: self.$pageIndex,
                            data: self.indexes,
                            id: \.self) {index in
                        VStack{
                            self.pageView(index)
                        }
                    }
                            .contentLoadingPolicy(.eager)
                            .onPageChanged({ page in
                                withAnimation(.easeOut) {
                                    self.pageIndex = page
                                }
                            }).frame(maxHeight: 150)
                    PageControl(index: self.$pageIndex, maxIndex: offers_png.count - 1)
                }
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

                }
                        .gridPacking(.dense)
                        .gridFlow(.rows)
                        .navigationBarTitle("Каталог", displayMode: .large)
                        .navigationBarItems(trailing:
                        NavigationLink(destination: CartView(tabViewTag: self.$tabViewTag)){
                            CartButton()
                        })
            }
        }.navigationBarHidden(true)
    }

    func pageView(_ index: Int) -> some View {
        if #available(iOS 14.0, *){
            return Image(self.offers_png[index]).resizable().centerCropped().padding([.leading, .trailing], 20).cornerRadius(40.0)
        }else{
            return Image(self.offers_png[index]).resizable().centerCropped().padding([.leading, .trailing], 20).cornerRadius(40.0)
        }
    }
}

struct PageControl: View {
    @Binding var index: Int
    let maxIndex: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0...maxIndex, id: \.self) { index in
                Circle()
                        .fill(index == self.index ? Color.buttonEndColor : Color.discountsPagerDotColor)
                        .frame(width: 8, height: 8)
            }
        }
                .padding(15)
    }
}



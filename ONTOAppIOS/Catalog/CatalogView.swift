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
                /*ZStack(alignment: .bottom){
                    Pager(page: self.$pageIndex,
                            data: self.indexes,
                            id: \.self) {index in
                            self.pageView(index)
                    }
                            .contentLoadingPolicy(.eager)
                            .onPageChanged({ page in
                                withAnimation(.easeOut) {
                                    self.pageIndex = page
                                }
                            })
                    PageControl(index: self.$pageIndex, maxIndex: offers_png.count - 1)
                }*/
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
                        .navigationBarItems(trailing:
                        NavigationLink(destination: CartView()){
                            HStack{
                                let sum = self.cartViewModel.getSum()
                                if(sum > 0){
                                    VStack{
                                        Text("\(sum) ₽")
                                                .foregroundColor(Color(.black))
                                                .padding(5)
                                                .frame(width: 75)
                                    }
                                            .background(Color.cartButtonSumColor)
                                            .cornerRadius(10)
                                            .padding(.top, 10)
                                            .padding(.leading, 10)
                                            .padding(.bottom, 10)
                                }
                                ZStack(alignment: .topTrailing){
                                    if #available(iOS 14.0, *){
                                        Image("ic_cart_svg")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .padding(.top, 10)
                                                .padding(.trailing, 10)
                                                .padding(.bottom, 10)
                                                .padding(.leading, 10)
                                                .frame(height: 50)
                                    }else{
                                        Image("ic_cart_png")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .padding(.all, 10)
                                                .frame(height: 50)
                                    }
                                    let count = self.cartViewModel.getCount()
                                    if(sum > 0) {
                                        VStack {
                                            Text("\(count)")
                                                    .foregroundColor(Color(.white))
                                                    .padding(5)
                                                    .font(.system(size: 10))
                                        }
                                                .background(Color.cartButtonCountColor)
                                                .border(Color.white, width: 1)
                                                .cornerRadius(50)
                                                .padding(.top, 5)
                                                .padding(.trailing, 5)
                                    }
                                }
                            }
                                    .background(Color(.white))
                                    .cornerRadius(30).padding(.all, 10)
                        })
            }
        }.navigationBarHidden(true)
    }

    func pageView(_ index: Int) -> some View {
        if #available(iOS 14.0, *){
            return Image(self.offers_svg[index]).resizable().aspectRatio(contentMode: .fit).padding([.leading, .trailing], 20).frame(maxWidth: 400)
        }else{
            return Image(self.offers_png[index]).resizable().aspectRatio(contentMode: .fit).padding([.leading, .trailing], 20).frame(maxWidth: 400)
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView().environmentObject(ViewRouter())
    }
}

struct PageControl: View {
    @Binding var index: Int
    let maxIndex: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0...maxIndex, id: \.self) { index in
                Circle()
                        .fill(index == self.index ? Color.white : Color.gray)
                        .frame(width: 8, height: 8)
            }
        }
                .padding(15)
    }
}



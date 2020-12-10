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
    @EnvironmentObject var cartViewModel: ViewRouter
    @State var isActive: Bool = false
    var tags = ["Кошка", "Собака", "Грызун", "Мышь", "Крыса", "Хомяк", "Дегу"]
    var offers_png = ["offer1_png", "offer1_png", "offer1_png"]
    var offers_svg = ["offer1_svg", "offer1_svg", "offer1_svg"]
    var indexes: [Int] = [0, 1, 2]
    @State private var height1: CGFloat = .zero
    @State private var height2: CGFloat = .zero




    var body: some View {


        NavigationView {

            VStack(alignment: .leading) {
                GeometryReader { gp in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            //FriendsHorizontalScrollView()

                            VStack(spacing: 0) {
                                // I want this view to take all the remaining height left in the scrollView

                                VStack(alignment: .leading) {
                                    pagerView()
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
                                            .frame(height: 40)
                                            .padding(.horizontal, 10)

                                    gridView()
                                }
                                        .background(GeometryReader {
                                            Color.clear
                                                    .preference(key: ViewHeightKey.self, value: $0.frame(in: .local).size.height)
                                        })
                            }.frame(height: max(gp.size.height - self.height1, self.height2))
                        }

                    }
                            .onPreferenceChange(ViewHeightKey.self) {
                                self.height2 = $0
                            }
                }

            } .background(NavigationConfigurator { nc in
                       // nc.hidesBarsOnSwipe = true
                        //nc.isNavigationBarHidden = true
                        //nc.navigationBar.barTintColor = .white

                    })
                    .navigationBarTitle("Каталог", displayMode: .large)
                    .navigationBarItems(trailing:
                    NavigationLink(destination: CartView()) {
                        HStack {
                            let sum = self.cartViewModel.getSum()
                            if (sum > 0) {
                                VStack {
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
                            ZStack(alignment: .topTrailing) {
                                if #available(iOS 14.0, *) {
                                    Image("ic_cart_svg")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding(.top, 10)
                                            .padding(.trailing, 10)
                                            .padding(.bottom, 10)
                                            .padding(.leading, 10)
                                            .frame(height: 50)
                                } else {
                                    Image("ic_cart_png")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding(.all, 10)
                                            .frame(height: 50)
                                }
                                let count = self.cartViewModel.getCount()
                                if (sum > 0) {
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
                .navigationBarHidden(true)
    }

    func gridView () -> some View {
        let value = ceil(Double(self.viewModel.products.count / 2))
        let value3 = value * 310
        let value4 = value3
        return Grid(tracks: 2) {
            ForEach(0..<self.viewModel.products.count) { i in
                let productCard = ProductCardView(text: self.viewModel.products[i].name, url: URL(string: self.viewModel.products[i].image)!, price: self.viewModel.products[i].price)
                ZStack(alignment: .bottomTrailing) {
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
                            .padding(.bottom, 12)
                }
            }
        }.frame(height: CGFloat(value4))
                .gridContentMode(.fill)
                .gridPacking(.dense)
                .gridFlow(.rows)

    }

    func pagerView() -> some View {
        return VStack {
            Pager(page: self.$pageIndex,
                    data: self.indexes,
                    id: \.self) { index in
                VStack {
                    self.pageView(index)
                }
            }
                    .contentLoadingPolicy(.eager)
                    .onPageChanged({ page in
                        withAnimation(.easeOut) {
                            self.pageIndex = page
                        }
                    }).frame(height: 150)
            PageControl(index: self.$pageIndex, maxIndex: offers_png.count - 1)
        }


    }


    func pageView(_ index: Int) -> some View {
        if #available(iOS 14.0, *){
            return Image(self.offers_png[index]).resizable().centerCropped().padding([.leading, .trailing], 20).cornerRadius(40.0)
        }else{
            return Image(self.offers_png[index]).resizable().centerCropped().padding([.leading, .trailing], 20).cornerRadius(40.0)
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
                        .fill(index == self.index ? Color.buttonEndColor : Color.discountsPagerDotColor)
                        .frame(width: 8, height: 8)
            }
        }
                .padding(15)
    }
}


struct ViewHeightKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}


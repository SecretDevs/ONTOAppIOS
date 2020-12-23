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
                                    VStack(alignment: .leading){
                                        Text("Каталог").font(.system(size: 23)).fontWeight(.bold).foregroundColor(Color.black).padding(.horizontal, 10)
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
                                                                        (self.selected != "") && (self.selected == tags[i]) ? Color.buttonEndColor : Color.buttonEndColor.opacity(0.13))
                                                                .foregroundColor(
                                                                        (self.selected != "") && (self.selected == tags[i]) ? Color.white
                                                                                : Color.buttonEndColor)
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

            }.navigationBarTitle("", displayMode: .inline)
                    .background(NavigationConfigurator { nc in
                        nc.navigationBar.barTintColor = .white
                        nc.navigationBar.shadowImage = UIImage()

                    })
                    .navigationBarItems(leading:  Image("ic_catalog_ONTO")
                            .padding(.all, 10)
                            .foregroundColor(Color.buttonEndColor), trailing:
                    NavigationLink(destination: CartView(tabViewTag: self.$tabViewTag)){
                        CartButton()
                    })
        }
                .navigationBarHidden(true)
                .introspectTabBarController{ controller in
                    controller.tabBar.isHidden = false
                }
    }



    func gridView () -> some View {

        if (self.viewModel.products.count > 0) {
            let value = ceil(Double(self.viewModel.products.count / 2))
            let value3 = value * 310
            let value4 = value3

            return AnyView(Grid(tracks: 2) {
                ForEach(0..<self.viewModel.products.count) { i in
                ZStack(alignment: .bottomTrailing) {
                    NavigationLink(destination: ItemView(shouldPopToRootView: self.$isActive, text: self.viewModel.products[i].name, url: URL(string: self.viewModel.products[i].image)!, price: self.viewModel.products[i].price, basePrice: 150.0, description: self.viewModel.products[i].description), isActive: self.$isActive) {
                        ProductCardView(text: self.viewModel.products[i].name, url: URL(string: self.viewModel.products[i].image)!, price: self.viewModel.products[i].price)
                                .gridSpan(column: 1)
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
                    .gridFlow(.rows))
        }
        else {
            return AnyView( VStack(alignment: .center) {
                Text("Loading...")
            })
        }

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


//
// Created by Илья Разработчик on 16.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage
import ExyteGrid


struct ItemView: View {

    @Binding var shouldPopToRootView: Bool
    @State private var tabBar: UITabBar?
    @EnvironmentObject var cartViewModel: ViewRouter
    @ObservedObject var viewModel = ItemViewModel()
    @ObservedObject var catalogViewModel = CatalogViewModel()


    var btnBack: some View {
        Button(action: {
            self.shouldPopToRootView = false

        }) {
            HStack {
                Image(systemName: "chevron.left").resizable().frame(width: 12, height: 20).foregroundColor(Color.black)
                Spacer()
                Text("Товар").font(.system(size: 23)).fontWeight(.bold).foregroundColor(Color.black)

            }.frame(width: 100)
        }
    }

    var id: Int32?
    var similarProducts: [OntoProduct] = [OntoProduct(id: 10, name: "Таракан", price: 150.0, image: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg", info: "Просто таракан", parameters: [["Белки": "15"], ["Жиры": "12"]], description: "Вкусеый сочный таракан", inStock: 2, similarProducts: [1, 2, 3]),
                                          OntoProduct(id: 11, name: "Таракан", price: 150.0, image: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg", info: "Просто таракан", parameters: [["Белки": "15"], ["Жиры": "12"]], description: "Вкусеый сочный таракан", inStock: 1, similarProducts: [1, 2, 3]),
                                          OntoProduct(id: 12, name: "Таракан", price: 150.0, image: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg", info: "Просто таракан", parameters: [["Белки": "15"], ["Жиры": "12"]], description: "Вкусеый сочный таракан", inStock: 1, similarProducts: [1, 2, 3])]
    var tags = ["Ежи", "Грызуны", "Птицы", "Рептилии", "Рыбы", "Млекопитающие", "Коты"]

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView() {
                VStack(alignment: .leading) {
                    HStack {
                        URLImage(URL(string: self.viewModel.product?.image ?? "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg")!, content: { image in
                            image.image.centerCropped()
                        }).frame(height: 180)
                                .cornerRadius(10)
                                .padding(.leading, 7)
                                .padding(.trailing, 7)
                        ItemViewInstructions(text: self.viewModel.product?.name ?? "", price: self.viewModel.product?.price ?? 0, basePrice: self.viewModel.product?.price ?? 0)
                    }

                    VStack(alignment: .leading) {
                        Text("Подходит для").fontWeight(.bold).padding(.leading, 15)
                        TagCloudView(tags: tags, tagBackgroundColor: Color.buttonEndColor.opacity(0.13), tagTextColor: Color.buttonEndColor, tagRadius: 10)
                    }

                    VStack {
                        Divider().padding(.leading, 15).padding(.trailing, 15)
                        DropDownView(expand: true, text: self.viewModel.product?.description ?? "", title: "Описание")
                        Divider().padding(.leading, 15).padding(.trailing, 15)
                        DropDownView(expand: false, text: self.viewModel.product?.description ?? "", title: "Подробнее")
                        Divider().padding(.leading, 15).padding(.trailing, 15)
                    }

                    VStack(alignment: .leading) {
                        Text("Похожие товары").fontWeight(.bold).padding(.leading, 15)
                        scroll()
                    }


                }
            }
        }
                .onAppear {
                    self.viewModel.getProduct(id: self.id ?? 0)
                }
                .background(NavigationConfigurator { nc in
                    nc.hidesBarsOnSwipe = true
                    //nc.isNavigationBarHidden = true
                    //nc.navigationBar.barTintColor = .white

                })
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: btnBack)
                .introspectTabBarController { controller in
                    self.tabBar = controller.tabBar
                    self.tabBar?.isHidden = true
                }
                .onDisappear {
                    self.tabBar?.isHidden = false
                }

    }

    func scroll() -> some View {
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
               // let end = self.viewModel.product?.similarProducts.count ?? 1
                ForEach(self.viewModel.product?.similarProducts ?? [1], id: \.self) { i in
                    subScroll(index: Int(i))
                }
            }
        }
    }

    func subScroll(index: Int) -> some View {
        let i = index - 1
        if (self.catalogViewModel.products.count != 0) {
            let productCard = ProductCardView(text: self.catalogViewModel.products[i].name, url: URL(string: self.catalogViewModel.products[i].image)!, price: self.catalogViewModel.products[i].price)
            return AnyView(ZStack(alignment: .bottomTrailing) {
                NavigationLink(destination: ItemView(shouldPopToRootView: self.$shouldPopToRootView, id: Int32(index))) {
                    productCard
                }.isDetailLink(false)

                Button(action: {
                    self.cartViewModel.addProductToCart(product: OntoProduct(id: Int32(i), name: self.catalogViewModel.products[i].name, price: self.catalogViewModel.products[i].price, image: self.catalogViewModel.products[i].image, info: self.catalogViewModel.products[i].info, parameters: self.catalogViewModel.products[i].parameters, description: self.catalogViewModel.products[i].description, inStock: 1, similarProducts: self.catalogViewModel.products[i].similarProducts))
                }) {
                    HStack {
                        Image("item_plus_button").resizable().aspectRatio(contentMode: .fit)
                    }.frame(width: 40)
                }.padding(.bottom, 12)
                        .padding(.trailing, 12)
                        .padding(.leading, 20)
            })
        } else {
            return AnyView(Text("Загрузка..."))
        }
    }
}

    struct ItemView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }





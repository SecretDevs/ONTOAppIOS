//
// Created by Илья Разработчик on 16.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage
import ExyteGrid


struct ItemView: View {

    @Binding var shouldPopToRootView : Bool
    @State private var tabBar: UITabBar?
    @EnvironmentObject var cartViewModel : ViewRouter


    var btnBack : some View {
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

    let text: String
    var similarProducts: [OntoProduct] = [OntoProduct(id: 10, name: "Таракан", price: 150.0, image: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg", info: "Просто таракан",parameters: [["Белки":"15"],["Жиры":"12"]], description: "Вкусеый сочный таракан", inStock: 2, similarProducts: [1,2,3]),
                                          OntoProduct(id: 11, name: "Таракан", price: 150.0, image: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg", info: "Просто таракан",parameters: [["Белки":"15"],["Жиры":"12"]], description: "Вкусеый сочный таракан", inStock: 1, similarProducts: [1,2,3]),
                                          OntoProduct(id: 12, name: "Таракан", price: 150.0, image: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg", info: "Просто таракан",parameters: [["Белки":"15"],["Жиры":"12"]], description: "Вкусеый сочный таракан", inStock: 1, similarProducts: [1,2,3])]
    var tags = ["Ежи", "Грызуны", "Птицы", "Рептилии", "Рыбы", "Млекопитающие", "Коты"]
    let url: URL
    let price: Float
    let basePrice: Float
    let description: String

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView() {
                VStack(alignment: .leading) {
                    HStack {
                        URLImage(self.url, content: { image in
                            image.image.centerCropped()
                        }).frame(height: 180)
                                .cornerRadius(10)
                        ItemViewInstructions(text: self.text, price: self.price, basePrice: self.basePrice)
                    }

                    VStack(alignment: .leading) {
                        Text("Подходит для").font(.body).padding()
                        TagCloudView(tags: tags, tagBackgroundColor: Color.green.opacity(0.3), tagTextColor: Color.green, tagRadius: 10)
                    }

                    VStack{
                        DropDownView(text: self.description, title: "Описание")
                        DropDownView(text: self.description, title: "Преимущества")
                    }

                    VStack(alignment: .leading) {
                        Text("Похожие товары").font(.body).padding()

                    }


                }
            }
        }.background(NavigationConfigurator { nc in
                   nc.hidesBarsOnSwipe = true
                    //nc.isNavigationBarHidden = true
                    //nc.navigationBar.barTintColor = .white

                })
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: btnBack)
                .introspectTabBarController{ controller in
                    self.tabBar = controller.tabBar
                    self.tabBar?.isHidden = true
                }
                .onDisappear{
                    self.tabBar?.isHidden = false
                }

    }

    func scroll() -> some View {
        return  ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                ForEach(0..<self.similarProducts.count) { i in
                    let productCard = ProductCardView(text: similarProducts[i].info, url: URL(string: similarProducts[i].image)!, price: similarProducts[i].price)
                    ZStack(alignment: .bottomTrailing) {
                        NavigationLink(destination: ItemView(shouldPopToRootView: self.$shouldPopToRootView, text: similarProducts[i].info, url: URL(string: similarProducts[i].image)!, price: similarProducts[i].price, basePrice: similarProducts[i].price, description: similarProducts[i].description)) {
                            productCard
                        }.isDetailLink(false)

                        Button(action: {
                            self.cartViewModel.addProductToCart(product: OntoProduct(id: similarProducts[i].id, name: similarProducts[i].name, price: similarProducts[i].price, image: similarProducts[i].image, info: similarProducts[i].info, parameters: [["Белки":"Жиры"]], description: similarProducts[i].description, inStock:1, similarProducts: [1,2,3]))
                        }) {
                            HStack {
                                Image("item_plus_button").resizable().aspectRatio(contentMode: .fit)
                            }.frame(width: 40)
                        }.padding(.bottom, 12)
                                .padding(.trailing, 12)
                                .padding(.leading,20)
                    }

                }
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




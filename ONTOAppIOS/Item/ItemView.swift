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

    var btnBack : some View {
            Button(action: {
                self.shouldPopToRootView = false

            }) {
                HStack {
                    Image("chevron.left") // set image here
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                    Text("Go back")
                }
            }
    }

    let text: String
    var similarProducts: [OntoProduct] = [OntoProduct(id: 3, name: "Таракан", price: 150.0, image: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg", info: "Просто таракан", description: "Вкусеый сочный таракан", isInStock: true),
                                          OntoProduct(id: 4, name: "Таракан", price: 150.0, image: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg", info: "Просто таракан", description: "Вкусеый сочный таракан", isInStock: true),
                                          OntoProduct(id: 5, name: "Таракан", price: 150.0, image: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg", info: "Просто таракан", description: "Вкусеый сочный таракан", isInStock: true)]

    var tags = ["Ежи", "Грызуны", "Птицы", "Рептилии", "Рыбы", "Млекопитающие", "Коты"]
    @State var selection: Int? = nil

    let url: URL

    let price: Float
    let basePrice: Float

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
                        DropDownView(text: self.text, title: "Описание")
                        DropDownView(text: self.text, title: "Преимущества")
                    }

                    VStack(alignment: .leading) {
                        Text("Похожие товары").font(.body).padding()

                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack() {
                            ForEach(0..<self.similarProducts.count) { i in
                                let offerCard = OfferCardView(text: similarProducts[i].info, url: URL(string: similarProducts[i].image)!, price: similarProducts[i].price, basePrice: similarProducts[i].price)
                                NavigationLink(destination: ItemView(shouldPopToRootView: self.$shouldPopToRootView, text : similarProducts[i].info,  url: URL(string: similarProducts[i].image)!, price : similarProducts[i].price,basePrice : similarProducts[i].price)) {
                                    offerCard
                                }.isDetailLink(false)

                            }
                        }
                    }
                }
            }
        }.navigationBarTitle("", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: btnBack)

    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




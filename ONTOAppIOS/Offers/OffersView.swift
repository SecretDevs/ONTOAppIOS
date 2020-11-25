//
// Created by Илья Разработчик on 16.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import ExyteGrid
import URLImage



struct OffersView: View{
    @ObservedObject var viewModel = OffersViewModel()
    @State var isActive: Bool = false

    var body: some View {
        NavigationView{
            Grid(tracks: 2) {
                ForEach(0..<self.viewModel.offers.count) { i in
                    let offerCard = OfferCardView(text: self.viewModel.offers[i].name, url: URL(string: self.viewModel.offers[i].image)!, price: self.viewModel.offers[i].price, basePrice: self.viewModel.offers[i].basePrice)
                    NavigationLink(destination: ItemView(shouldPopToRootView: self.$isActive, text : "Offer",  url: URL(string: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg")!, price : self.viewModel.offers[i].price,basePrice : self.viewModel.offers[i].basePrice), isActive: self.$isActive) {
                        offerCard.gridSpan(column: 1)
                    }.isDetailLink(false)
                }
                OfferCardView(text: "Offer", url: URL(string: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg")!, price: 100.0 , basePrice: 150.0)
                        .gridSpan(column: 1)
                OfferCardView(text: "Offer", url: URL(string: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg")!, price : 100.0 , basePrice : 150.0)
                        .gridSpan(column: 1)

            }.gridContentMode(.scroll)
                    .gridPacking(.dense)
                    .gridFlow(.rows)
                    .navigationBarTitle("Акции")
                    .navigationBarItems(trailing:
                    HStack(alignment: .center){
                        Text("Корзина")
                    }
                    )
        }

    }
}


struct OffersView_Previews: PreviewProvider{
    static var previews: some View{
        OffersView()
    }
}
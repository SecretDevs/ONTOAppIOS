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

    var body: some View {
        NavigationView {
            Grid(tracks: 2) {
                ForEach(0..<self.viewModel.offers.count) { i in
                    OfferCardView(text: self.viewModel.offers[i].name, url: URL(string: self.viewModel.offers[i].image)!)
                            .gridSpan(column: 1)
                }
                OfferCardView(text: "Offer", url: URL(string: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg")!)
                        .gridSpan(column: 1)
                OfferCardView(text: "Offer", url: URL(string: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg")!)
                        .gridSpan(column: 1)

            }
                    .gridContentMode(.scroll)
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

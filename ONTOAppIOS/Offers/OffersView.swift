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

    var body: some View{
        Grid(tracks: 2){
            ForEach(0..<self.viewModel.offers.count) { i in
                OfferCardView(text: self.viewModel.offers[i].name, url: URL(string: self.viewModel.offers[i].image)!)
                        .gridSpan(column: i % 2 == 0 ? 2 : 1)
                Text("Offer")
                Text("Offer")
            }
        }

    }

}

struct OffersView_Previews: PreviewProvider{
    static var previews: some View{
        OffersView()
    }
}

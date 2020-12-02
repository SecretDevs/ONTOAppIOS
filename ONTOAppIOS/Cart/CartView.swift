//
// Created by Ivanov Ivan on 01.12.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

import SwiftUI
import os

struct CartView: View {

    @EnvironmentObject var viewModel : ViewRouter

    var body: some View {
        //ScrollView {
            Button(action: {
                if #available(iOS 14.0, *) {
                    let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "observable")
                    logger.log("\(self.viewModel.selectedProducts)")
                } else {
                    // Fallback on earlier versions
                }
            }) {
                HStack {
                    Image("item_plus_button").resizable().aspectRatio(contentMode: .fit)
                }.frame(width: 30)
            }.padding(5)
            List(self.viewModel.selectedProducts) { pair in
                ProductInCartCardView(text: pair.product.name, url: URL(string: pair.product.image)!, price: pair.product.price, count: pair.count)
            }
                    .navigationBarTitle("Корзина")
        //}

    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView().environmentObject(ViewRouter())
    }
}
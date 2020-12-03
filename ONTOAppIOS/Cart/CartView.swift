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
            List(self.viewModel.selectedProducts) { pair in
                ProductInCartCardView(text: pair.product.name, url: URL(string: pair.product.image)!, price: pair.product.price, count: pair.count)
            }
                    .navigationBarTitle("Корзина")
    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView().environmentObject(ViewRouter())
    }
}
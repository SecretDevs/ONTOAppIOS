//
// Created by Ivanov Ivan on 01.12.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

import SwiftUI

struct CartView: View {

    @ObservedObject var viewModel = CartViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                List(viewModel.selectedProducts){ pair in
                    let product = pair.product
                    ProductInCartCardView(text: product.name, url: URL(string: product.image)!, price: product.price, count: pair.count)
                }
                        .navigationBarTitle("Корзина")}
        }

    }
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
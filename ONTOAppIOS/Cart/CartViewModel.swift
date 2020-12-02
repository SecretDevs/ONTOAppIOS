//
// Created by Ivanov Ivan on 01.12.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

class CartViewModel: ObservableObject{

    @Published var selectedProducts = [ProductInCart]()

    func addProductToCart(product: OntoProduct){
        if (selectedProducts.contains{$0.product.id == product.id}){
            selectedProducts.append(ProductInCart(product: product, count: 1))
        }else{
            selectedProducts[selectedProducts.firstIndex(where: {$0.product.id == product.id})!].count += 1
        }
    }

    func deleteProductFromCart(productIndex: Int){
        selectedProducts.remove(at: productIndex)
    }
}
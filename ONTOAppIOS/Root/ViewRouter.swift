//
// Created by Ivanov Ivan on 24.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject{
    @Published var currentPage: String
    @Published var selectedProducts = [ProductInCart]()

    init(){
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore"){
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "welcome"
        }else{
            currentPage = "main"
        }

    }

    func addProductToCart(product: OntoProduct){
        //if (selectedProducts.contains{$0.product.id == product.id}){
            selectedProducts.append(ProductInCart(product: product, count: 1))
        //}else{
        //    selectedProducts[selectedProducts.firstIndex(where: {$0.product.id == product.id})!].count += 1
        //}
    }

    func deleteProductFromCart(productIndex: Int){
        selectedProducts.remove(at: productIndex)
    }
}
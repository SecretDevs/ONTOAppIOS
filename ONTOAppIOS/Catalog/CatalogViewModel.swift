//
// Created by Илья Разработчик on 28.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class CatalogViewModel: ObservableObject{
    @Published var products: [OntoProduct] = []
    @Published var similarProducts: [Int : [OntoProduct]] = [0 : []]

    var cancellation: AnyCancellable?
    let service = CatalogService()

    init(){
        fetchCatalog()
    }

    private func fetchCatalog() {
        cancellation = service.fetch()
                .mapError ({ (error) -> Error in
                    print(error)
                    return error
                })
                .sink(receiveCompletion: {_ in}, receiveValue: { ontoResponse in
                    self.products = ontoResponse.data.products

                    self.products.forEach { p in
                        var arr: [OntoProduct] = []
                        p.similarProducts.forEach { i in
                            arr.append(ontoResponse.data.products[Int(i)-1])
                        }
                        self.similarProducts[Int(p.id)] = arr
                    }

                })
    }
}
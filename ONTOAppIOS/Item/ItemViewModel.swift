//
// Created by Илья Разработчик on 18.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import Combine

class ItemViewModel: ObservableObject{

    @Published var product: OntoProduct?
    var cancellation: AnyCancellable?
    let service = CatalogService()

    func getProduct(id: Int32) {
        cancellation = service.fetch()
                .mapError({ (error) -> Error in
                    print(error)
                    return error
                })
                .sink(receiveCompletion: {_ in}, receiveValue: { ontoResponse in
                    self.product = ontoResponse.data.products[Int(id) - 1]
                })
    }
}
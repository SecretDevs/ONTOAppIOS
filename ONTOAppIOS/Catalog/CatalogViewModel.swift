//
// Created by Илья Разработчик on 28.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import Combine

class CatalogViewModel: ObservableObject{
    @Published var products: [OntoProduct] = []
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
                })
    }
}
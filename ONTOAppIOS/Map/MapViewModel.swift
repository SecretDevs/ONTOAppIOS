//
// Created by Ivanov Ivan on 24.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import Combine
import MapKit

class MapViewModel: ObservableObject{
    @Published var centerCoordinate = CLLocationCoordinate2D()
    @Published var shops: [OntoShop] = []
    var cancellation: AnyCancellable?
    let service = ShopsService()

    init(){
        fetchShops()
    }

    private func fetchShops() {
        cancellation = service.fetch()
                .mapError ({ (error) -> Error in
                    print(error)
                    return error
                })
                .sink(receiveCompletion: {_ in}, receiveValue: { ontoResponse in
                    self.shops = ontoResponse.data.shops
                })
    }
}
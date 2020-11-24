//
// Created by Илья Разработчик on 16.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//


import Foundation
import Combine

class OffersViewModel: ObservableObject{
    @Published var offers: [OntoOffer] = []
    var cancellation: AnyCancellable?
    let service = OffersService()

    init(){
        fetchOffers()
    }

    private func fetchOffers() {
        cancellation = service.fetch()
                .mapError ({ (error) -> Error in
                    print(error)
                    return error
                })
                .sink(receiveCompletion: {_ in}, receiveValue: { ontoResponse in
                    self.offers = ontoResponse.data.offers
                })
    }
}
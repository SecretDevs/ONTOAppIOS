//
// Created by Илья Разработчик on 16.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//


import Foundation
import Combine

class OffersViewModel: ObservableObject{
    enum State{
        case idle
        case loading
        case failed(Error)
        case loaded([OntoOffer])
    }

    @Published private(set) var state = State.idle
    var cancellation: AnyCancellable?
    let service = OffersService()

    func fetchOffers() {
        cancellation = service.fetch()
                .mapError ({ (error) -> Error in
                    self.state = .failed(error)
                    return error
                })
                .sink(receiveCompletion: {_ in}, receiveValue: { ontoResponse in
                    self.state = .loaded(ontoResponse.data.offers)
                })
    }
}
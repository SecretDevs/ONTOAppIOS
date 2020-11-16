//
// Created by Илья Разработчик on 16.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//


import Foundation
import Alamofire
import Combine


class OffersService{
    let url = "https://onto-ipc.herokuapp.com/"

    func fetch() -> AnyPublisher<OntoResponseOffers, AFError> {
        let publisher = AF.request(url + "offers").publishDecodable(type: OntoResponseOffers.self)
        return publisher.value()
    }
}
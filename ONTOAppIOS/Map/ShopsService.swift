//
// Created by Ivanov Ivan on 24.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import Alamofire
import Combine

class ShopsService{
    let url = "https://onto-ipc.herokuapp.com/"

    func fetch() -> AnyPublisher<OntoResponseShops, AFError> {
        let publisher = AF.request(url + "shops").publishDecodable(type: OntoResponseShops.self)
        return publisher.value()
    }
}
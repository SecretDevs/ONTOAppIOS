//
// Created by Илья Разработчик on 28.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import Alamofire
import Combine


class CatalogService{
    let url = "https://onto-ipc.herokuapp.com/"

    func fetch() -> AnyPublisher<OntoResponseProducts, AFError> {
        let publisher = AF.request(url + "products").publishDecodable(type: OntoResponseProducts.self)
        return publisher.value()
    }
}
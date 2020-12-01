//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import Alamofire
import Combine


class ArticlesService{
    let url = "https://onto-ipc.herokuapp.com/"

    func fetch() -> AnyPublisher<OntoResponseArticles, AFError> {
        let publisher = AF.request(url + "articles").publishDecodable(type: OntoResponseArticles.self)
        let result = publisher.value()
        return result
    }
}
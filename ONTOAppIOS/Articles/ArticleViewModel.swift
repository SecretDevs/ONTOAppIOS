//
// Created by Ivanov Ivan on 16.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import Combine

class ArticleViewModel: ObservableObject{

    @Published var article: OntoArticle?
    var cancellation: AnyCancellable?
    let service = ArticlesService()

    func getArticle(id: Int32) {
        cancellation = service.fetch()
        .mapError({ (error) -> Error in
            print(error)
            return error
        })
        .sink(receiveCompletion: {_ in}, receiveValue: { ontoResponse in
            self.article = ontoResponse.data.articles[Int(id) - 1]
        })
    }
}

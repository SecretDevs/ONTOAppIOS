//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import Combine

class ArticlesViewModel: ObservableObject{
    enum State{
        case idle
        case loading
        case failed(Error)
        case loaded([OntoArticle])
    }

    @Published private(set) var state = State.idle
    var cancellation: AnyCancellable?
    let service = ArticlesService()

    func fetchArticles() {
        state = .loading

        cancellation = service.fetch()
        .mapError ({ (error) -> Error in
            self.state = .failed(error)
            return error
        })
        .sink(receiveCompletion: {_ in}, receiveValue: { ontoResponse in
            self.state = .loaded(ontoResponse.data.articles)
        })
    }
}
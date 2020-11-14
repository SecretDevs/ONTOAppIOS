//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import Combine

class ArticlesViewModel: ObservableObject{
    @Published var articles: [OntoArticle] = []
    var cancellation: AnyCancellable?
    let service = ArticlesService()

    init(){
        fetchArticles()
    }

    private func fetchArticles() {
        cancellation = service.fetch()
        .mapError ({ (error) -> Error in
            print(error)
            return error
        })
        .sink(receiveCompletion: {_ in}, receiveValue: { ontoResponse in
            self.articles = ontoResponse.data.articles
        })
    }
}
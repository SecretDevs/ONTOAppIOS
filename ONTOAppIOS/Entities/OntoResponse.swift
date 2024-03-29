//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

struct DataArticles: Codable{
    let articles: [OntoArticle]

    enum CodingKeys: String, CodingKey{
        case articles
    }
}

struct OntoResponseArticles: Codable{
    let data: DataArticles

    enum CodingKeys: String, CodingKey{
        case data
    }
}
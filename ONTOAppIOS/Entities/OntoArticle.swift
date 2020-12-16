//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

struct OntoArticle: Codable, Identifiable{
    let id: Int32
    let name: String
    let image: String
    let text: String
    let date: String

    enum CodingKeys: String, CodingKey{
        case id = "article_id"
        case name
        case image
        case text
        case date
    }
}
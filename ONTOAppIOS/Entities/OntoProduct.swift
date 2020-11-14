//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

struct OntoProduct: Codable, Identifiable{
    let id: Int32
    let name: String
    let price: Float
    let image: String
    let info: String
    let description: String
    let isInStock: Bool

    enum CodingKeys: String, CodingKey{
        case id = "product_id"
        case name
        case price
        case image
        case info
        case description
        case isInStock = "is_in_stock"
    }
}
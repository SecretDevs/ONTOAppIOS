//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

struct OntoProduct: Codable, Identifiable, Hashable{
    let uuid = UUID()
    let id: Int32
    let name: String
    let price: Float
    let image: String
    let info: String
    let parameters : [[String:String]]
    let description: String
    let inStock: Int32
    let similarProducts: [Int32]

    enum CodingKeys: String, CodingKey{
        case id = "product_id"
        case name
        case price
        case image
        case info
        case parameters
        case description
        case inStock = "in_stock"
        case similarProducts = "similar_products"
    }
}
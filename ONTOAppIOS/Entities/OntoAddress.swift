//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

struct OntoAddress: Codable{
    let city: String
    let street: String
    let house: Int
    let apartment: Int

    enum CodingKeys: String, CodingKey{
        case city
        case street
        case house
        case apartment
    }
}
//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

struct OntoPet: Codable{
    let type: String
    let name: String

    enum CodingKeys: String, CodingKey{
        case type
        case name
    }
}
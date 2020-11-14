//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

struct OntoLocation: Codable{
    let latitude: Float
    let longitude: Float

    enum CodingKeys: String, CodingKey{
        case latitude = "lat"
        case longitude = "long"
    }
}
//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

struct OntoPickPoint: Codable, Identifiable{
    let id: Int32
    let name: String
    let address: String
    let location: OntoLocation

    enum CodingKeys: String, CodingKey{
        case id = "point_id"
        case name
        case address
        case location
    }
}
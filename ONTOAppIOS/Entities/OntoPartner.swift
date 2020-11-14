//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

struct OntoPartner: Codable, Identifiable{
    let id: Int32
    let name: String
    let logo: String

    enum CodingKeys: String, CodingKey{
        case id = "partner_id"
        case name
        case logo
    }
}
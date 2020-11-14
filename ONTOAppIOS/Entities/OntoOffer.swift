//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

struct OntoOffer: Codable, Identifiable{
    let id: Int32
    let name: String
    let price: Float
    let basePrice: Float
    let image: String
    let offerInfo: String
    let partner: OntoPartner
    let description: String
    let expiration: String

    enum CodingKeys: String, CodingKey{
        case id = "offer_id"
        case name
        case price
        case basePrice = "base_price"
        case image
        case offerInfo = "offer_info"
        case partner
        case description
        case expiration
    }
}
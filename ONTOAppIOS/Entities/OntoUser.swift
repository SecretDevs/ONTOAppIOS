//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

struct OntoUser: Codable, Identifiable{
    let id: Int32
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
    let address: OntoAddress

    enum CodingKeys: String, CodingKey{
        case id = "user_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case phone
        case email
        case address
    }
}
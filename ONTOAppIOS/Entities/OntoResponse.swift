//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

struct DataArticles: Codable{
    let articles: [OntoArticle]

    enum CodingKeys: String, CodingKey{
        case articles
    }
}

struct OntoResponseArticles: Codable{
    let data: DataArticles

    enum CodingKeys: String, CodingKey{
        case data
    }
}

struct DataOffers: Codable{
    let offers: [OntoOffer]

    enum CodingKeys: String, CodingKey{
        case offers
    }
}

struct OntoResponseOffers: Codable{
    let data: DataOffers

    enum CodingKeys: String, CodingKey{
        case data
    }
}

struct DataShops: Codable{
    let shops: [OntoShop]

    enum CodingKeys: String, CodingKey{
        case shops
    }
}

struct OntoResponseShops: Codable{
    let data: DataShops

    enum CodingKeys: String, CodingKey{
        case data
    }
}
//
// Created by Ivanov Ivan on 01.12.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation

struct ProductInCart: Identifiable{
    var id = UUID()
    var product: OntoProduct
    var count: Int
}
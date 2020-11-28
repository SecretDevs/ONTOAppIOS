//
// Created by Ivanov Ivan on 28.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import UIKit
import MapKit

class ShopPointAnnotation: MKPointAnnotation {
    var address: String!
    var phone: String!

    init(address: String, phone: String) {
        self.address = address
        self.phone = phone
    }
}

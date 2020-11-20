//
//  StringUtils.swift
//  ONTOAppIOS
//
//  Created by Ivanov Ivan on 17.11.2020.
//  Copyright © 2020 Ivanov Ivan. All rights reserved.
//

import Foundation

extension String{
    func toDate() -> String.SubSequence {
        let index = self.index(self.startIndex, offsetBy: 10)
        return self[..<index]
    }
}

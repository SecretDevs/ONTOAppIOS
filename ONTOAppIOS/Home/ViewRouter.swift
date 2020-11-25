//
// Created by Ivanov Ivan on 24.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject{
    @Published var currentPage: String

    init(){
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore"){
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "welcome"
        }else{
            currentPage = "main"
        }
    }
}
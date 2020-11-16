//
// Created by Ivanov Ivan on 16.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct ArticleView: View {
    var id: Int32?

    @ObservedObject var viewModel = ArticleViewModel()

    var body: some View{
        HStack{
            Text("Hello")
        }
    }

}
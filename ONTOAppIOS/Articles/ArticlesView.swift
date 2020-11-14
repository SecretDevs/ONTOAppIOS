//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct ArticlesView: View{
    @ObservedObject var viewModel = ArticlesViewModel()

    var body: some View{
        List(viewModel.articles) { article in
            HStack {
                VStack(alignment: .leading) {
                    Text(article.name).font(.headline)
                }
            }
        }
    }
}

struct ArticlesView_Previews: PreviewProvider{
    static var previews: some View{
        ArticlesView()
    }
}
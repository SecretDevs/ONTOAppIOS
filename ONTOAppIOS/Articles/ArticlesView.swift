//
// Created by Ivanov Ivan on 14.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import ExyteGrid
import URLImage


struct ArticlesView: View{
    @ObservedObject var viewModel = ArticlesViewModel()

    var body: some View{
                Grid(tracks: 2){
                    ForEach(0..<self.viewModel.articles.count) { i in
                        VCardView(text: self.viewModel.articles[i].name, url: URL(string: self.viewModel.articles[i].image)!)
                                .gridSpan(column: i % 2 == 0 ? 2 : 1)
                        Text("Article")
                        Text("Article")
                    }
                }

    }

}

struct ArticlesView_Previews: PreviewProvider{
    static var previews: some View{
        ArticlesView()
    }
}

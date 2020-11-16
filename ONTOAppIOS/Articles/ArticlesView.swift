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
            Grid(tracks: 2) {
                ForEach(0..<self.viewModel.articles.count) { i in
                        ArticleCardView(text: self.viewModel.articles[i].name, url: URL(string: self.viewModel.articles[i].image)!)
                                .gridSpan(column: i % 2 == 0 ? 2 : 1)
                }
                ArticleCardView(text: "Article", url: URL(string: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg")!)
                        .gridSpan(column: 1)
                ArticleCardView(text: "Article", url: URL(string: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg")!)
                        .gridSpan(column: 1)
                ArticleCardView(text: "Article", url: URL(string: "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg")!)
                        .gridSpan(column: 2)

            }
                    .gridContentMode(.scroll)
                    .gridPacking(.dense)
                    .gridFlow(.rows)

    }

}

struct ArticlesView_Previews: PreviewProvider{
    static var previews: some View{
        ArticlesView()
    }
}

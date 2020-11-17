//
// Created by Ivanov Ivan on 16.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import URLImage

struct ArticleView: View {
    var id: Int32?

    @ObservedObject var viewModel = ArticleViewModel()

    var body: some View{
        ScrollView{
            VStack{
                URLImage(URL(string: viewModel.article?.image ?? "https://bio-onto.ru/wp-content/uploads/2020/08/whatsapp-image-2020-08-06-at-15.13.20.jpeg")!,content: {image in
                    image.image
                            .centerCropped()
                }).frame(maxWidth: UIScreen.main.bounds.width).frame(height: 200)
                .cornerRadius(15)
                .padding(.leading, 5)
                .padding(.trailing, 5)
                VStack(alignment: .leading){
                    Text(viewModel.article?.date.toDate() ?? "").font(.system(size: 12, weight: .medium)).foregroundColor(Color.gray)
                    Text(viewModel.article?.name ?? "").font(.system(size: 16, weight: .heavy)).padding(.top, 2)
                    Text(viewModel.article?.text ?? "").padding(.top, 5).font(.system(size: 12, weight: .medium))
                }.padding([.leading, .trailing])
                Spacer()
            }.onAppear{
                self.viewModel.getArticle(id: self.id ?? 0)
            }
        }
    }

}

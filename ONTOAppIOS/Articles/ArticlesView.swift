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
    @EnvironmentObject var cartViewModel : ViewRouter

    var body: some View{
        switch viewModel.state{
        case .idle:
            Color.clear.onAppear(perform: viewModel.fetchArticles)
        case .loading:
            if #available(iOS 14.0, *) {
                ProgressView()
            }else{
                Text("Loading...")
            }
        case .failed(let error):
            VStack{
                Text("Error. Try again.")
                Button(action: {
                    viewModel.fetchArticles()
                }) {
                    Text("Try again.")
                }
            }
        case .loaded(let articles):
            NavigationView {
                Grid(tracks: 2) {
                    ForEach(0..<articles.count) { i in
                        NavigationLink(destination: ArticleView(id: articles[i].id)){
                            ArticleCardView(text: articles[i].name, url: URL(string: articles[i].image)!)
                                    .gridSpan(column: i % 2 == 0 ? 2 : 1)
                        }

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
                        .background(NavigationConfigurator { nc in
                            nc.hidesBarsOnSwipe = true
                            nc.navigationBar.barTintColor = .white
                            nc.navigationBar.shadowImage = UIImage()

                        })
                        .navigationBarTitle("", displayMode: .inline)
                        .navigationBarItems(leading: HStack(alignment: .bottom) {
                            Text("Материалы").font(.system(size: 26))
                                    .fontWeight(.bold).foregroundColor(Color.black)
                        }, trailing:
                        NavigationLink(destination: CartView()){
                            HStack{
                                let sum = self.cartViewModel.getSum()
                                if(sum > 0){
                                    VStack{
                                        Text("\(sum) ₽")
                                                .foregroundColor(Color(.black))
                                                .padding(5)
                                                .frame(width: 75)
                                    }
                                            .background(Color.cartButtonSumColor)
                                            .cornerRadius(10)
                                            .padding(.top, 10)
                                            .padding(.leading, 10)
                                            .padding(.bottom, 10)
                                }
                                ZStack(alignment: .topTrailing){
                                    Image("ic_cart")
                                            .padding(.all, 10)
                                            .foregroundColor(Color.buttonEndColor)
                                    let count = self.cartViewModel.getCount()
                                    if(sum > 0) {
                                        VStack {
                                            Text("\(count)")
                                                    .foregroundColor(Color(.white))
                                                    .padding(5)
                                                    .font(.system(size: 10))
                                        }
                                                .background(Circle().foregroundColor(Color.cartButtonCountColor).border(Color.white, width: 1))
                                                .padding(.top, 5)
                                                .padding(.trailing, 5)
                                    }
                                }
                            }
                                    .cornerRadius(30)
                        })

            }
        }
    }

}

struct ArticlesView_Previews: PreviewProvider{
    static var previews: some View{
        ArticlesView()
    }
}

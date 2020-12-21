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
    @State private var scrollViewID = UUID()

    @ObservedObject var viewModel = ArticleViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>


    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            VStack(alignment: .center) {
                HStack {
                    Image(systemName: "chevron.left").resizable().frame(width: 12, height: 20).foregroundColor(Color.black)
                    Spacer()
                    Text("Подробнее").font(.system(size: 23)).fontWeight(.bold).foregroundColor(Color.black)

                }.frame(width: 150)
            }
        }
    }

    var body: some View{

        ZStack(alignment: .bottomTrailing){
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
                    .id(self.scrollViewID)
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: btnBack)
            Button(action: {
                self.scrollViewID = UUID()
            }, label: {
                HStack {
                    Image("ic_up_button").resizable().aspectRatio(contentMode: .fit)
                }.frame(width: 50)
            })
                    .padding(.trailing, 12)
                    .padding(.bottom, 6)
        }
    }

}

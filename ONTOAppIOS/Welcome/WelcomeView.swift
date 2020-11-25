//
// Created by Ivanov Ivan on 24.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftUIPager

struct WelcomeView: View {
    @State var pageIndex = 0

    var indexes: [Int]  = [0, 1, 2]
    var images_svg: [String] = [
        "welcome_1_svg", "welcome_2_svg", "welcome_3_svg"
    ]
    var images_png: [String] = [
        "welcome_1_png", "welcome_2_png", "welcome_3_png"
    ]

    var body: some View {
        NavigationView{
            Pager(page: self.$pageIndex,
                    data: self.indexes,
                    id: \.self) {index in
                VStack{
                    self.pageView(index)
                    NavigationLink(destination: MainView(), label: {
                        Button(action: {
                            withAnimation(.easeOut){
                                self.pageIndex = min(self.images_svg.count - 1, self.pageIndex + 1)
                            }
                        }, label: {
                            Text("ДАЛЕЕ")
                                    .padding([.top, .bottom], 16)
                                    .padding([.leading, .trailing], 65)
                                    .foregroundColor(.white)
                                    .background(LinearGradient(gradient: Gradient(colors: [.buttonStartColor, .buttonEndColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .cornerRadius(12.0)
                                    .shadow(color: .buttonShadowColor, radius: 9, y: 3)
                        }).disabled(self.pageIndex >= self.images_svg.count - 1)
                    }).padding(.top, 10)
                    NavigationLink(destination: MainView()){
                        Text("ПРОПУСТИТЬ")
                                .padding([.top, .bottom], 16)
                                .padding([.leading, .trailing], 65)
                                .foregroundColor(.black)
                    }
                }
            }
                    .contentLoadingPolicy(.eager)
                    .onPageChanged({ page in
                        withAnimation(.easeOut) {
                            self.pageIndex = page
                        }
                    }).navigationBarHidden(true)
        }
    }

    func pageView(_ index: Int) -> some View {
        if #available(iOS 14.0, *){
            return Image(self.images_svg[index]).resizable().aspectRatio(contentMode: .fit).padding([.leading, .trailing], 20).frame(maxHeight: 500)
        }else{
            return Image(self.images_png[index]).resizable().aspectRatio(contentMode: .fit).padding([.leading, .trailing], 20).frame(maxHeight: 500)
        }
    }

}

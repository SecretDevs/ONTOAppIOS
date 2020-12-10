//
// Created by Илья Разработчик on 20.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI

struct MainView: View {
    @State var tag = 2
    @EnvironmentObject var cartViewModel : ViewRouter

    var body: some View {
        NavigationView{
            TabView (selection: $tag){
                ZStack(alignment: .topTrailing){
                    MapView()
                    NavigationLink(destination: CartView()){
                        HStack{
                            let sum = self.cartViewModel.getSum()
                            if(sum > 0){
                                VStack{
                                    Text("\(sum) ₽")
                                            .foregroundColor(Color(.black))
                                            .padding(5)
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
                                            .cornerRadius(50)
                                            .padding(.top, 5)
                                            .padding(.trailing, 5)
                                }
                            }
                        }
                                .background(Color(.white))
                                .cornerRadius(30).padding(.all, 10)
                    }
                }
                        .tabItem{
                            Image("ic_map").renderingMode(.template)
                        }.tag(0).navigationBarHidden(true)
                OffersView()

                        .tabItem {
                            Image("ic_discount").renderingMode(.template)
                        }.tag(1).navigationBarHidden(true)


                CatalogView()
                        .tabItem {
                            Image("ic_store").renderingMode(.template)
                        }.tag(2).navigationBarHidden(true)


                ArticlesView()
                        .tabItem {
                            Image("ic_articles").renderingMode(.template)
                        }.tag(3).navigationBarHidden(true)

                ProfileView()
                        .tabItem {
                            Image("ic_profile").renderingMode(.template)
                        }.tag(4).navigationBarHidden(true)
            }.accentColor(Color.buttonEndColor)
                    .onAppear() {
                        UITabBar.appearance().barTintColor = .white
                        UITabBar.appearance().unselectedItemTintColor = .black
                        UITabBar.appearance().shadowImage = UIImage()
                    }
        }.navigationBarHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

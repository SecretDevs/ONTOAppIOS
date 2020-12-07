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
                                if #available(iOS 14.0, *){
                                    Image("ic_cart_svg")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding(.top, 10)
                                            .padding(.trailing, 10)
                                            .padding(.bottom, 10)
                                            .padding(.leading, 10)
                                            .frame(maxHeight: 50)
                                }else{
                                    Image("ic_cart_png")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding(.all, 10)
                                            .frame(maxHeight: 50)
                                }
                                let count = self.cartViewModel.getCount()
                                if(sum > 0) {
                                    VStack {
                                        Text("\(count)")
                                                .foregroundColor(Color(.white))
                                                .padding(5)
                                                .font(.system(size: 10))
                                    }
                                            .background(Color.cartButtonCountColor)
                                            .border(Color.white, width: 1)
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
                            Image(systemName: "map.fill")
                        }.tag(0).navigationBarHidden(true)
                OffersView()

                        .tabItem {
                            Image(systemName: "percent").renderingMode(.template)
                        }.tag(1).navigationBarHidden(true)


                CatalogView()
                        .tabItem {
                            Image(systemName: "bag") .font(Font.system(.largeTitle).bold())
                        }.tag(2).navigationBarHidden(true)


                ArticlesView()
                        .tabItem {
                            Image(systemName: "magnifyingglass").font(Font.title.weight(.bold))
                        }.tag(3).navigationBarHidden(true)

                ProfileView()
                        .tabItem {
                            Image(systemName: "person").font(Font.title.weight(.bold))
                        }.tag(4).navigationBarHidden(true)
            }.accentColor(Color.green)
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

//
// Created by Илья Разработчик on 20.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import Introspect

struct MainView: View {
    @State var tag = 2

    var body: some View {
        NavigationView{
            TabView (selection: $tag){
                MapWrapperView(tabViewTag: self.$tag)
                        .tabItem{
                            Image("ic_map").renderingMode(.template)
                        }.tag(0).navigationBarHidden(true)

                OffersView(tabViewTag: self.$tag)
                        .tabItem {
                            Image("ic_discount").renderingMode(.template)
                        }.tag(1).navigationBarHidden(true)


                CatalogView(tabViewTag: self.$tag)
                        .tabItem {
                            Image("ic_store").renderingMode(.template)
                        }.tag(2).navigationBarHidden(true)


                ArticlesView(tabViewTag: self.$tag)
                        .tabItem {
                            Image("ic_articles").renderingMode(.template)
                        }.tag(3).navigationBarHidden(true)

                ProfileView(tabViewTag: self.$tag)
                        .tabItem {
                            Image("ic_profile").renderingMode(.template)
                        }.tag(4).navigationBarHidden(true)
            }.accentColor(Color.buttonEndColor)
                    .onAppear() {
                        UITabBar.appearance().barTintColor = .white
                        UITabBar.appearance().unselectedItemTintColor = .black
                        UITabBar.appearance().shadowImage = UIImage()
                    }
                    .introspectTabBarController{ controller in
                        controller.tabBar.isHidden = false
                    }
        }.navigationBarHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

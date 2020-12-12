//
// Created by Илья Разработчик on 20.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI

struct MainView: View {
    @State var tag = 2

    var body: some View {
        NavigationView{
            TabView (selection: $tag){
                MapWrapperView()
                        .tabItem{
                            Image("ic_map").renderingMode(.template)
                        }.tag(0).navigationBarHidden(true)

                OffersView()
                        .tabItem {
                            Image("ic_discount").renderingMode(.template)
                        }.tag(1).navigationBarHidden(true)


                CatalogView(viewModel: CatalogViewModel())
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

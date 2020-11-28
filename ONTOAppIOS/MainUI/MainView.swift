//
// Created by Илья Разработчик on 20.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI

struct MainView: View {
    @State var tag = 0

    var body: some View {
        TabView (selection: $tag){
            MapView()
                    .tabItem{
                        Image(systemName: "map.fill")
                    }.tag(0)
            OffersView()
                        .tabItem {
                            Image(systemName: "phone.fill")
                        }.tag(1)


            ArticlesView()
                        .tabItem {
                            Image(systemName: "tv.fill")
                        }.tag(2)
            }.accentColor(Color.green)
                .navigationBarTitle(getTitle(number: tag))
            .onAppear() {
                UITabBar.appearance().barTintColor = .white
                UITabBar.appearance().unselectedItemTintColor = .black
                UITabBar.appearance().shadowImage = UIImage()
            }
    }
}


func getTitle(number: Int) -> String {
    switch (number) {

    case 0 : return "Offer"
    case 1 : return "Articel"
    default:
        return "Offer"
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

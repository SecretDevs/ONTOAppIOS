//
// Created by Ivanov Ivan on 24.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI

struct RootView: View{
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View{
        VStack{
            if viewRouter.currentPage == "welcome" {
                WelcomeView()
            }else if viewRouter.currentPage == "main"{
                MainView()
            }
        }
    }

}

struct RootView_Previews: PreviewProvider{
    static var previews: some View{
        RootView().environmentObject(ViewRouter())
    }
}
//
// Created by Ivanov Ivan on 12.12.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct MapWrapperView: View {

    @Binding var tabViewTag : Int
    @EnvironmentObject var cartViewModel : ViewRouter

    var body: some View {
        NavigationView{
            ZStack(alignment: .topTrailing){
                MapView()
                NavigationLink(destination: CartView(tabViewTag: self.$tabViewTag)){
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
            }.navigationBarHidden(true)
        }
    }
}
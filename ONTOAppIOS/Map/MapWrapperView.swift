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
                                        .frame(width: 83)
                            }
                                    .background(Color.cartButtonSumColor)
                                    .cornerRadius(10)
                                    .padding(.all, 10)
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
                                }.frame(width: 5 * CGFloat(cartViewModel.getCount()/10) + 17, height: 17)
                                        .background(Capsule()
                                                .strokeBorder(Color.white,lineWidth: 1)
                                                .background(Capsule().foregroundColor(Color.cartButtonCountColor)))
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
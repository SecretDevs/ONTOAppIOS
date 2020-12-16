//
// Created by Ivanov Ivan on 09.12.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import os

struct CartButton: View {

    @EnvironmentObject var cartViewModel: ViewRouter

    var body: some View {
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
                        .padding(.top, 10)
                        .padding(.bottom, 10)
            }
            ZStack(alignment: .topTrailing){//
                Image("ic_cart")
                        .padding(.top, 5)
                        .padding(.bottom,5)
                        .padding(.horizontal, 5)
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
                }
            }
        }
    }
}


struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton().environmentObject(ViewRouter())
    }
}
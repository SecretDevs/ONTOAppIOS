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
                            .frame(width: 75)
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
                            .padding(.top, 5)
                            .padding(.trailing, 5)
                }
            }
        }
                .cornerRadius(30).padding(.all, 10)
    }
}


struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton().environmentObject(ViewRouter())
    }
}
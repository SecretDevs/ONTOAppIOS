//
// Created by Ivanov Ivan on 01.12.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage

struct ProductInCartCardView: View {
    let text: String
    let url: URL
    let price: Float
    let count: Int


    var body: some View {
        HStack(alignment: .center) {
            URLImage(self.url, content: {image in
                image.image.centerCropped()
            }).frame(height: 90)
                    .cornerRadius(10)

            VStack(alignment: .leading) {
                Text(self.text)
                        .foregroundColor(.black)
                        .layoutPriority(.greatestFiniteMagnitude)
                HStack{
                    Spacer()
                    Text("\(self.count, specifier: "%.0f")")
                            .foregroundColor(.black)
                            .layoutPriority(.greatestFiniteMagnitude)
                }
            }
                    .padding(.leading)
                    .padding(.trailing)
            VStack{
                Spacer()

                HStack {
                    Text("\(self.price, specifier: "%.0f")").fontWeight(.bold)
                            .foregroundColor(.red)
                            .layoutPriority(.greatestFiniteMagnitude)
                            .font(.system(size: 20))
                }
                        .padding(.all,5)
                        .padding(.bottom,10)
                        .padding(.leading)
            }

        }
                .background(Color.white)
    }
}
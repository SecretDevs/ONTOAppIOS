//
// Created by Илья Разработчик on 16.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//


import Foundation
import SwiftUI
import URLImage

struct OfferCardView: View {
    let text: String

    let url: URL

    var body: some View {
        VStack(alignment: .center) {
            URLImage(self.url, content: {image in
                image.image.resizable().aspectRatio(contentMode: .fill)
            })
            Text(self.text)
                    .foregroundColor(.white)
                    .layoutPriority(.greatestFiniteMagnitude)
            HStack{
                Text("145P")
                        .foregroundColor(.red)
                        .layoutPriority(.greatestFiniteMagnitude)
                Text("100P")
                        .foregroundColor(.white)
                        .layoutPriority(.greatestFiniteMagnitude)
                Text("Button")
                        .foregroundColor(.white)
                        .layoutPriority(.greatestFiniteMagnitude)
            }
        }.frame(width: UIScreen.main.bounds.width, height: 200)
                .padding(5)
    }
}

struct OfferCardView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

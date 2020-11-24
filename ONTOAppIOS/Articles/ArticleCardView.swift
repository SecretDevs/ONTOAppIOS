//
// Created by Ivanov Ivan on 24.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage

struct ArticleCardView: View {
    let text: String
    let url: URL

    var body: some View {
        VStack{
            Spacer()
            Text(self.text)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color.white)
                    .padding(.all, 10)
                    .layoutPriority(.greatestFiniteMagnitude)

        }
                .frame(maxWidth: UIScreen.main.bounds.width, alignment: .bottom)
                .frame(height: 200)
                .background(Color.black.opacity(0.5))
                .background(URLImage(self.url, content: {image in
                    image.image
                            .centerCropped()
                }))
                .cornerRadius(15)
                .padding(.all, 5)
    }
}
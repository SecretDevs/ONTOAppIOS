//
//  VCardView.swift
//  ONTOAppIOS
//
//  Created by Ivanov Ivan on 15.11.2020.
//  Copyright © 2020 Ivanov Ivan. All rights reserved.
//

import Foundation
import SwiftUI
import URLImage

struct ArticleCardView: View {
   let text: String
   let url: URL
   
   var body: some View {
            VStack{
                Text(self.text)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color.white)
                        .padding(.all, 10)
                        .layoutPriority(.greatestFiniteMagnitude)

            }
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 200, alignment: .bottom)
                    .background(Color.black.opacity(0.5))
                    .background(URLImage(self.url, content: {image in
                        image.image
                                .centerCropped()
                    }))
                    .cornerRadius(15)
                    .padding(.all, 5)
   }
}

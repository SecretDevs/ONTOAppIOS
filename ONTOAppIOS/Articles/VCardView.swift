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

extension Image {
    func centerCropped() -> some View {
        GeometryReader { geo in
            self
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .clipped()
        }
    }
}

struct VCardView: View {
   let text: String
   let url: URL
   
   var body: some View {
            VStack{
                Text(self.text)
                        .foregroundColor(Color.white)
                        .layoutPriority(.greatestFiniteMagnitude)
                        .padding(.all, 50)

            }
                    .frame(alignment: .bottom)
                    .background(Color.black.opacity(0.3))
                    .background(URLImage(self.url, content: {image in
                        image.image
                                .centerCropped()
                    }))
                    .cornerRadius(10)
                    .padding(.all, 5)
   }
}

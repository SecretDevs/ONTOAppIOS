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

struct VCardView: View {
   let text: String
   let url: URL
   
   var body: some View {
       ZStack(alignment: .bottom) {
           URLImage(self.url, content: {image in
               image.image.resizable().aspectRatio(contentMode: .fill)
           })
           Text(self.text)
                   .foregroundColor(.white)
               .layoutPriority(.greatestFiniteMagnitude)
       }.frame(width: UIScreen.main.bounds.width, height: 200)
       .padding(5)
   }
}

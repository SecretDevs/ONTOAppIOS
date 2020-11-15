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
       VStack {
           Text(self.text)
               .layoutPriority(.greatestFiniteMagnitude)
       }
       .background(URLImage(self.url, content: {image in
        image.image.resizable().aspectRatio(contentMode: .fill)
       }))
       .padding(5)
       .gridCellOverlay { _ in
           RoundedRectangle(cornerRadius: 5)
       }
   }
}

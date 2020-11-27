//
//  TagsView.swift
//  ONTOAppIOS
//
//  Created by Ivanov Ivan on 17.11.2020.
//  Copyright © 2020 Ivanov Ivan. All rights reserved.
//

import Foundation
import SwiftUI

struct TagCloudButtonView: View {
    @Binding var selected : String
    var tags: [String]
    var tagBackgroundColor: Color
    var tagBackgroundColorSelected: Color
    var tagTextColor: Color
    var tagTextColorSelected: Color
    var tagRadius: CGFloat


    @State private var totalHeight
          = CGFloat.zero       // << variant for ScrollView/List
          //  = CGFloat.infinity   // << variant for VStack

    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)// << variant for ScrollView/List
        //.frame(maxHeight: totalHeight) // << variant for VStack
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.self) { tag in
                self.item(for: tag)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == self.tags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for text: String) -> some View {

        Button(action: {
            self.selected = text
        }) {
            Text(text)
                    .padding(.all, 5)
                    .font(.body)
                    .background(
                            (self.selected != "") && (self.selected == text) ? tagBackgroundColorSelected : tagBackgroundColor)
                    .foregroundColor(
                            (self.selected != "") && (self.selected == text) ? tagTextColorSelected
                                    : tagTextColor)
                    .cornerRadius(tagRadius)
        }
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}
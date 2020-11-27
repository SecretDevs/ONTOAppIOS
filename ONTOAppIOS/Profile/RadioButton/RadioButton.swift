//
// Created by Илья Разработчик on 27.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI

struct RadioButton: View {

    @Binding var selected : Bool
    var body: some View {

        HStack {
            Button(action: {
                if (!self.selected) {
                    self.selected = true
                }
                else {
                    self.selected = false
                }
            }) {
                HStack {
                    self.selected ? Image("by_adress_selected").resizable().aspectRatio(contentMode: .fit)
                            : Image("by_adress_not_selected").resizable().aspectRatio(contentMode: .fit)
                }.frame(width: 30, height: 30)
            }.padding()

            Text("Доставка по адресу").font(.body)
        }
    }
}


//
// Created by Илья Разработчик on 19.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI

struct DropDownView: View {

    @State var expand: Bool
    let text: String
    let title: String
    var body: some View {
        VStack{
            HStack{
                Text(self.title).fontWeight(.bold)
                Spacer()

                if (expand){
                Image(systemName:  "chevron.up").resizable().frame(width: 16, height: 8)
                        .font(Font.title.weight(.bold))
                }
                else {
                    Image(systemName:  "chevron.right").resizable().frame(width: 8, height: 16)
                            .font(Font.title.weight(.bold))
                }
            }.contentShape(Rectangle())
                    .onTapGesture {
                self.expand.toggle()
            }

            if expand {
                Text(self.text)
            }


        }
        .padding(.leading,15).padding(.trailing,15)
                .padding(.bottom,4)
                .padding(.top,4)
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct DropDownItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
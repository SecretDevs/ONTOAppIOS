//
// Created by Илья Разработчик on 19.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI

struct DropDownView: View {

    @State var expand = false
    let text: String
    let title: String
    var body: some View {
        VStack{
            HStack{
                Text(self.title).fontWeight(.heavy)
                Spacer()

                if (expand){
                Image(systemName:  "chevron.up").resizable().frame(width: 13, height: 6)
                }
                else {
                    Image(systemName:  "chevron.right").resizable().frame(width: 6, height: 13)
                }
            }.contentShape(Rectangle())
                    .onTapGesture {
                self.expand.toggle()
            }

            if expand {
                Text(self.text)
            }


        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct DropDownItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
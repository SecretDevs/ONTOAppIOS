//
// Created by Илья Разработчик on 16.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import ExyteGrid
import URLImage



struct OffersView: View{
    @Binding var tabViewTag : Int
    @ObservedObject var viewModel = OffersViewModel()
    @EnvironmentObject var cartViewModel : ViewRouter
    @State var isActive: Bool = false

    var body: some View {
        switch viewModel.state {
        case .idle:
            Color.clear.onAppear(perform: viewModel.fetchOffers)
        case .loading:
            if #available(iOS 14.0, *) {
                ProgressView()
            } else {
                Text("Loading...")
            }
        case .failed(let error):
            VStack {
                Text("Error. Try again.")
                Button(action: {
                    viewModel.fetchOffers()
                }) {
                    Text("Try again.")
                }
            }
        case .loaded(let offers):
            NavigationView{
                Grid(tracks: 2) {
                    ForEach(0..<offers.count) { i in
                        let offerCard = OfferCardView(text: offers[i].name, url: URL(string: offers[i].image)!, price: offers[i].price, basePrice: offers[i].basePrice)
                        ZStack(alignment: .bottomTrailing){
                            NavigationLink(destination: ItemView(shouldPopToRootView: self.$isActive, text : offers[i].name,  url: URL(string: offers[i].image)!, price: offers[i].price, basePrice: offers[i].basePrice, description: offers[i].description), isActive: self.$isActive) {
                                offerCard.gridSpan(column: 1)
                            }.isDetailLink(false)
                            Button(action: {
                                self.cartViewModel.addProductToCart(product: OntoProduct(id: offers[i].id, name: offers[i].name, price: offers[i].price, image: offers[i].image, info: offers[i].offerInfo, description: offers[i].description, isInStock: false))
                            }) {
                                HStack {
                                    Image("item_plus_button").resizable().aspectRatio(contentMode: .fit)
                                }.frame(width: 40)
                            }.padding(.bottom, 12)
                            .padding(.trailing, 12)
                            .padding(.leading,20)
                        }
                    }
                }.gridContentMode(.scroll)
                        .gridPacking(.dense)
                        .gridFlow(.rows)
                        .navigationBarTitle("Акции")
                        .navigationBarItems(trailing:
                        NavigationLink(destination: CartView(tabViewTag: self.$tabViewTag)){
                            CartButton()
                        })
            }
        }

    }
}


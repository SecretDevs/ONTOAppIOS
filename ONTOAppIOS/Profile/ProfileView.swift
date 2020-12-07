//
// Created by Илья Разработчик on 26.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation


import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var cartViewModel : ViewRouter
    @State var selectedDelivery : Bool = false
    @State var name = ""
    @State var lastname = ""
    @State var email = ""
    @State var number = ""
    @State var city = ""
    @State var street = ""
    @State var house = ""
    @State var room = ""
    @State var k = ""
    @State var selcted : String = ""
    @State private var isEditingLastName = false
    @State private var isEditingName = false
    @State private var isEditingEmail = false
    @State private var isEditingNumber = false
    @State private var isEditingCity = false
    @State private var isEditingStreet = false
    @State private var isEditingHouse = false
    @State private var isEditingRoom = false
    @State private var isEditingK = false
    var tags = ["Кошка", "Собака", "Грызун", "Мышь", "Крыса", "Хомяк", "Дегу"]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {

                    VStack(alignment: .leading) {
                        Text("Какой у вас питомец?").font(.body).padding()
                        TagCloudButtonView(selected: $selcted, tags: tags, tagBackgroundColor: Color.green.opacity(0.3),tagBackgroundColorSelected: Color.green,
                                tagTextColor: Color.green, tagTextColorSelected : Color.white,
                                tagRadius: 10)
                    }.padding(.bottom).padding(.horizontal)


                    VStack(alignment: .leading) {
                        Text("Имя")
                                .font(.callout)
                                .bold()
                        TextField("Введите имя...", text: $name) {
                            isEditing in
                            self.isEditingName = isEditing
                        }
                                .textFieldStyle(PlainTextFieldStyle())
                        Divider().frame(height: 2)
                                .background(isEditingName ? Color.green : Color.gray)
                                .padding(.top, 5)
                    }.padding()


                    VStack(alignment: .leading) {
                        Text("Фамилия")
                                .font(.callout)
                                .bold()
                        TextField("Введите фамилию...", text: $lastname) {
                            isEditing in
                            self.isEditingLastName = isEditing
                        }
                                .textFieldStyle(PlainTextFieldStyle())
                        Divider().frame(height: 2)
                                .background(isEditingLastName ? Color.green : Color.gray)
                                .padding(.top, 5)
                    }.padding()

                    VStack(alignment: .leading) {
                        Text("E-mail")
                                .font(.callout)
                                .bold()
                        TextField("Введите e-mail...", text: $lastname) {
                            isEditing in
                            self.isEditingEmail = isEditing
                        }
                                .textFieldStyle(PlainTextFieldStyle())
                        Divider().frame(height: 2)
                                .background(isEditingEmail ? Color.green : Color.gray)
                                .padding(.top, 5)
                    }.padding()

                    VStack(alignment: .leading) {
                        Text("Телефон")
                                .font(.callout)
                                .bold()
                        TextField("Введите телефон...", text: $lastname) {
                            isEditing in
                            self.isEditingNumber = isEditing
                        }
                                .textFieldStyle(PlainTextFieldStyle())
                        Divider().frame(height: 2)
                                .background(isEditingNumber ? Color.green : Color.gray)
                                .padding(.top, 5)
                    }.padding()

                    VStack(alignment: .leading) {
                        RadioButton(selected: self.$selectedDelivery)
                    }


                    VStack(alignment: .leading) {
                        Text("Город")
                                .font(.callout)
                                .bold()
                        TextField("Введите город...", text: $city) {
                            isEditing in
                            self.isEditingCity = isEditing
                        }
                                .textFieldStyle(PlainTextFieldStyle())
                        Divider().frame(height: 2)
                                .background(isEditingCity ? Color.green : Color.gray)
                                .padding(.top, 5)
                    }.padding()



                    VStack(alignment: .leading) {
                        Text("Улица")
                                .font(.callout)
                                .bold()
                        TextField("Введите улицу...", text: $street) {
                            isEditing in
                            self.isEditingStreet = isEditing
                        }
                                .textFieldStyle(PlainTextFieldStyle())
                        Divider().frame(height: 2)
                                .background(isEditingStreet ? Color.green : Color.gray)
                                .padding(.top, 5)
                    }.padding()

                    HStack {
                        VStack(alignment: .leading) {
                            Text("Дом")
                                    .font(.callout)
                                    .bold()
                            TextField("1...", text: $house) {
                                isEditing in
                                self.isEditingHouse = isEditing
                            }
                                    .textFieldStyle(PlainTextFieldStyle())
                            Divider().frame(height: 2)
                                    .background(isEditingHouse ? Color.green : Color.gray)
                                    .padding(.top, 5)
                        }.padding()

                        VStack(alignment: .leading) {
                            Text("Корпус")
                                    .font(.callout)
                                    .bold()
                            TextField("2...", text: $k) {
                                isEditing in
                                self.isEditingK = isEditing
                            }
                                    .textFieldStyle(PlainTextFieldStyle())
                            Divider().frame(height: 2)
                                    .background(isEditingK ? Color.green : Color.gray)
                                    .padding(.top, 5)
                        }.padding()

                        VStack(alignment: .leading) {
                            Text("Квартира")
                                    .font(.callout)
                                    .bold()
                            TextField("111...", text: $room) {
                                isEditing in
                                self.isEditingRoom = isEditing
                            }
                                    .textFieldStyle(PlainTextFieldStyle())
                            Divider().frame(height: 2)
                                    .background(isEditingRoom ? Color.green : Color.gray)
                                    .padding(.top, 5)
                        }.padding()
                    }

                }
            .navigationBarTitle("Личный кабинет")}
                    .navigationBarItems(trailing:
                    NavigationLink(destination: CartView()){
                        HStack{
                            let sum = self.cartViewModel.getSum()
                            if(sum > 0){
                                VStack{
                                    Text("\(sum) ₽")
                                            .foregroundColor(Color(.black))
                                            .padding(5)
                                            .frame(width: 75)
                                }
                                        .background(Color.cartButtonSumColor)
                                        .cornerRadius(10)
                                        .padding(.top, 10)
                                        .padding(.leading, 10)
                                        .padding(.bottom, 10)
                            }
                            ZStack(alignment: .topTrailing){
                                if #available(iOS 14.0, *){
                                    Image("ic_cart_svg")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding(.top, 10)
                                            .padding(.trailing, 10)
                                            .padding(.bottom, 10)
                                            .padding(.leading, 10)
                                            .frame(height: 50)
                                }else{
                                    Image("ic_cart_png")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding(.all, 10)
                                            .frame(height: 50)
                                }
                                let count = self.cartViewModel.getCount()
                                if(sum > 0) {
                                    VStack {
                                        Text("\(count)")
                                                .foregroundColor(Color(.white))
                                                .padding(5)
                                                .font(.system(size: 10))
                                    }
                                            .background(Color.cartButtonCountColor)
                                            .border(Color.white, width: 1)
                                            .cornerRadius(50)
                                            .padding(.top, 5)
                                            .padding(.trailing, 5)
                                }
                            }
                        }
                                .background(Color(.white))
                                .cornerRadius(30).padding(.all, 10)
                    })
        }

    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

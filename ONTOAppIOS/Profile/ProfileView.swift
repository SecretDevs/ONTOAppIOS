//
// Created by Илья Разработчик on 26.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation


import SwiftUI

struct ProfileView: View {
    @Binding var tabViewTag : Int
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
                        TagCloudButtonView(selected: $selcted, tags: tags, tagBackgroundColor: Color.buttonEndColor.opacity(0.13),tagBackgroundColorSelected: Color.buttonEndColor,
                                tagTextColor: Color.buttonEndColor, tagTextColorSelected : Color.white,
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
                                .background(isEditingName ? Color.buttonEndColor : Color.gray)
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
                                .background(isEditingLastName ? Color.buttonEndColor : Color.gray)
                                .padding(.top, 5)
                    }.padding()

                    VStack(alignment: .leading) {
                        Text("E-mail")
                                .font(.callout)
                                .bold()
                        TextField("Введите e-mail...", text: $email) {
                            isEditing in
                            self.isEditingEmail = isEditing
                        }
                                .textFieldStyle(PlainTextFieldStyle())
                        Divider().frame(height: 2)
                                .background(isEditingEmail ? Color.buttonEndColor : Color.gray)
                                .padding(.top, 5)
                    }.padding()

                    VStack(alignment: .leading) {
                        Text("Телефон")
                                .font(.callout)
                                .bold()
                        TextField("Введите телефон...", text: $number) {
                            isEditing in
                            self.isEditingNumber = isEditing
                        }
                                .textFieldStyle(PlainTextFieldStyle())
                        Divider().frame(height: 2)
                                .background(isEditingNumber ? Color.buttonEndColor : Color.gray)
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
                                .background(isEditingCity ? Color.buttonEndColor : Color.gray)
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
                                .background(isEditingStreet ? Color.buttonEndColor : Color.gray)
                                .padding(.top, 5)
                    }.padding()

                    HStack {
                        VStack(alignment: .leading) {
                            Text("Дом")
                                    .font(.callout)
                                    .bold()
                            TextField("1", text: $house) {
                                isEditing in
                                self.isEditingHouse = isEditing
                            }
                                    .textFieldStyle(PlainTextFieldStyle())
                            Divider().frame(height: 2)
                                    .background(isEditingHouse ? Color.buttonEndColor : Color.gray)
                                    .padding(.top, 5)
                        }.padding()

                        VStack(alignment: .leading) {
                            Text("Корпус")
                                    .font(.callout)
                                    .bold()
                            TextField("1", text: $k) {
                                isEditing in
                                self.isEditingK = isEditing
                            }
                                    .textFieldStyle(PlainTextFieldStyle())
                            Divider().frame(height: 2)
                                    .background(isEditingK ? Color.buttonEndColor : Color.gray)
                                    .padding(.top, 5)
                        }.padding()

                        VStack(alignment: .leading) {
                            Text("Квартира")
                                    .font(.callout)
                                    .bold()
                            TextField("111", text: $room) {
                                isEditing in
                                self.isEditingRoom = isEditing
                            }
                                    .textFieldStyle(PlainTextFieldStyle())
                            Divider().frame(height: 2)
                                    .background(isEditingRoom ? Color.buttonEndColor : Color.gray)
                                    .padding(.top, 5)
                        }.padding()
                    }

                }
            }.background(NavigationConfigurator { nc in
                        nc.navigationBar.barTintColor = .white
                        nc.navigationBar.shadowImage = UIImage()
                    })
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarItems(leading:HStack(alignment: .bottom){
                        Text("Личный кабинет").font(.system(size: 23))
                                .fontWeight(.bold).foregroundColor(Color.black)}
                            , trailing:
                         NavigationLink(destination: CartView(tabViewTag: self.$tabViewTag)){
                                 CartButton()
                    }
                    )
        }

    }
}

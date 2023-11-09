//
//  CreateNewView.swift
//  RememberApp
//
//  Created by Student23 on 09/11/23.
//

import SwiftUI

struct CreateNewView: View {
    var userId: String
    @State private var tema = "";
    @State private var isPublic = true;
    @StateObject var vm = ViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            //Color(.blue) // TODO
            VStack {
                Spacer().frame(height: 30)
                Text("Novo Baralho")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    //.padding(.top, 40)
                    .shadow(radius: 3)
                Spacer()
                HStack{
                    Text("Tema:")
                        .foregroundColor(.white)
                        .padding(.trailing, 10)
                    Spacer()
                    TextField("", text: $tema)
                            .textFieldStyle(.roundedBorder)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 10)
                HStack {
                    Button(action: {
                        isPublic = true
                    }) {
                        if isPublic {
                            Circle()
                                .strokeBorder(.white, lineWidth: 2)
                                .frame(width: 25, height: 25)
                                .overlay(Circle().fill(Color.white)
                                    .frame(width: 16, height: 16))
                        } else {
                            Circle()
                                .strokeBorder(.white, lineWidth: 2)
                                .frame(width: 25, height: 25)
                        }
                        Text("Público")
                            .padding(.trailing, 40).foregroundColor(.white)
                    }
                    .padding(.leading, 20)
                    Button(action: {
                        isPublic = false
                    }) {
                        if !isPublic {
                            Circle()
                                .strokeBorder(.white, lineWidth: 2)
                                .frame(width: 25, height: 25)
                                .overlay(Circle().fill(Color.white)
                                    .frame(width: 16, height: 16))
                        } else {
                            Circle()
                                .strokeBorder(.white, lineWidth: 2)
                                .frame(width: 25, height: 25)
                        }
                        Text("Privado").foregroundColor(.white)
                    }
                }
                .padding(.top, 10)
                Spacer()
                Button(action: {
                    vm.createDeck(msg: tema, userId: userId)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Salvar")
                        .font(.custom("PT-Sans", size: 18, relativeTo: .headline))
                        .frame(width: 320) // TODO
                }
                
                .buttonStyle(.bordered)
                .background(.green)
                .foregroundColor(.white)
                .padding(.top, 40)
                Spacer()
            }
            .padding()
        }.background(LinearGradient(colors: [Color("DarkBlue"), Color("LightBlue")], startPoint: .bottom, endPoint: .top))
        .ignoresSafeArea()
    }
}


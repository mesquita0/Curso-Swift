//
//  CreateNewView.swift
//  CopiaDoAnki
//
//  Created by Student23 on 30/10/23.
//

import SwiftUI

struct CreateNewView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var tema = "";
    @State private var isPublic = true;
    
    var body: some View {
        ZStack {
            Color(.blue) // TODO
            VStack {
                Text("Novo Baralho")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding(.top, 40)
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
                        // TODO: fazer texto publico clicavel
                    }
                    .padding(.leading, 30)
                    Text("Público")
                        .padding(.trailing, 40)
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
                        // TODO: fazer texto privado clicavel
                    }
                    Text("Privado")
                }
                .padding(.top, 10)
                Spacer()
                Button(action: {
                    // TODO: Salvar nota
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Salvar")
                        .font(.system(size: 20))
                        .frame(width: 320) // TODO
                }
                
                .buttonStyle(.bordered)
                .background(.green)
                .foregroundColor(.white)
                .padding(.top, 40)
                Spacer()
            }
            .padding(25)
        }
        .ignoresSafeArea()    }
}

struct CreateNewView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewView()
    }
}

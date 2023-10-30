//
//  EditCardView.swift
//  CopiaDoAnki
//
//  Created by Student23 on 30/10/23.
//

import SwiftUI

struct EditCardView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var frente = "";
    @State private var tras = "";
    
    var body: some View {
        ZStack {
            Color(.blue) // TODO
            VStack {
                Text("Editando")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding(.top, 40)
                Spacer()
                HStack{
                    Text("Frente:")
                        .foregroundColor(.white)
                        .padding(.trailing, 10)
                    Spacer()
                    TextField("", text: $frente)
                            .textFieldStyle(.roundedBorder)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 10)
                HStack{
                    Text("Trás:")
                        .foregroundColor(.white)
                        .padding(.trailing, 25)
                        .padding(.bottom, 100)
                    TextField("", text: $tras, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.trailing, 20)
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
        .ignoresSafeArea()
    }
}

struct EditCardView_Previews: PreviewProvider {
    static var previews: some View {
        EditCardView()
    }
}

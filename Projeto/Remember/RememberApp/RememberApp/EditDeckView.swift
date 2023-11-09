//
//  EditDeckView.swift
//  RememberApp
//
//  Created by Student23 on 09/11/23.
//

import SwiftUI

struct EditDeckView: View {
    var baralho: Binding<Baralho>
    @State private var deck: Baralho
    @State private var saved = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(baralho: Binding<Baralho>) {
        self._deck = State(initialValue: baralho.wrappedValue)
        self.baralho = baralho
    }
    
    var body: some View {
        VStack {
            Text(baralho.wrappedValue.subject)
                .foregroundColor(.white)
                .shadow(radius: 3)
                .font(.largeTitle)
            //Spacer().frame(height: 10)
            ScrollView {
                VStack {
                    
                    
                    ForEach(baralho.wrappedValue.cards, id: \.self) { card in
                        HStack {
                            VStack {
                                Text(card.front)
                                    .font(.custom("PT-Sans", size: 22, relativeTo: .headline))
                                    .foregroundColor(Color("DarkBlue"))
                               
                                Spacer().frame(height: 10)
                                Text(card.back)
                                    .font(.custom("PT-Sans", size: 16, relativeTo: .headline))
                                    .foregroundColor(Color(.gray))
                                    .font(.subheadline)
                            }

                            Spacer()
                            NavigationLink {
                                EditCardView(baralho: $deck, indexCard: baralho.wrappedValue.cards.firstIndex(of: card)! , saved: $saved)
                            } label: {
                                Image(systemName: "pencil").font(.title).foregroundColor(Color("DarkBlue"))
                            }
                        }
                        .padding(10)
                        .frame(width: 300, height: 80)
                             .background(
                            Rectangle()
                                //.frame(width: 320, height: 80)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        )
                        
                        Spacer().frame(height: 25)
                    }
                    
                    
//                    Button(action: {
//                        self.presentationMode.wrappedValue.dismiss()
//                    }) {
//                        Text("Salvar")
//                            .frame(width: 320, height: 30)
//                            .font(.custom("PT-Sans", size: 18))
//                    }
//                    .buttonStyle(.bordered)
//                    .foregroundColor(.white)
//                    .background(.green)
//                    .cornerRadius(5)
//                    .padding(.top)
//                    .shadow(radius: 10)
                    //.padding(.top, 40)
                    
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).background(LinearGradient(colors: [Color("DarkBlue"), Color("LightBlue")], startPoint: .bottom, endPoint: .top))
            .onAppear() {
                if (saved) {
                    baralho.wrappedValue = deck
                    saved = false
                }
        }
    }

}

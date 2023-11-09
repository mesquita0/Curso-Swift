//
//  PlayView.swift
//  RememberApp
//
//  Created by Student23 on 09/11/23.
//

import SwiftUI

struct PlayView: View {
    var baralho: Baralho
    @State var answered: Bool = false
    @State var showingPopUp: Bool = false
    @State var cardIndex: Int = 0

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Spacer().frame(height: 40)
            ZStack {
                VStack {
                    Text(baralho.subject).font(.largeTitle).shadow(radius: 3)
                    
                    Spacer().frame(height: 150)
                    
                    Text(baralho.cards[cardIndex].front).font(.title).padding()
                    Text(answered ? baralho.cards[cardIndex].back : "").padding()
                    
                    HStack {
                        Button {
                            showingPopUp.toggle()
                        } label: {
                            Image(systemName: "lightbulb.fill").font(.title)
                        }
                        
                        Spacer().frame(width: 30)
                        
                        Button {
                            answered = true
                            showingPopUp = false
                        } label: {
                            Image(systemName: "eye.fill").font(.title)
                        }
                    }.padding()
                    
                    if (answered) {
                        HStack {
                            Button {
                                answered = false
                                showingPopUp = false

                                if (baralho.cards.count > cardIndex + 1) {
                                    cardIndex += 1
                                } else {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            } label: {
                                Text("Fácil").padding().background(.green).cornerRadius(5)
                            }
                            
                            Button {
                                answered = false
                                showingPopUp = false

                                if (baralho.cards.count > cardIndex + 1) {
                                    cardIndex += 1
                                } else {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            } label: {
                                Text("Médio").padding().background(.yellow).cornerRadius(5)
                            }
                            
                            Button {
                                answered = false
                                showingPopUp = false

                                if (baralho.cards.count > cardIndex + 1) {
                                    cardIndex += 1
                                } else {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            } label: {
                                Text("Difícil").padding().background(.red).cornerRadius(5)
                            }
                        }
                    }
                    
                    
                    Spacer()
                    
                }.padding().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                
                if (showingPopUp && !answered) {
                    Text(baralho.cards[cardIndex].tip!).foregroundColor(.black).frame(width: 300, height: 100).background(.white).cornerRadius(5).onTapGesture {
                        showingPopUp = false
                    }.offset(y: 180)
                }
            }
        }.background(LinearGradient(colors: [Color("DarkBlue"), Color("LightBlue")], startPoint: .bottom, endPoint: .top)).foregroundColor(.white).ignoresSafeArea()
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView(baralho: Baralho(_id: "Teste", _rev: "", subject: "Teste", cards: [Carta(front: "frente", back: "tras", tip: "dica")], userId: ""))
    }
}

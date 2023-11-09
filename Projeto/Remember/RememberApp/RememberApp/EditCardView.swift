//
//  EditCardView.swift
//  RememberApp
//
//  Created by Student23 on 09/11/23.
//

import SwiftUI

struct EditCardView: View {
    var baralho: Binding<Baralho>
    var indexCard: Int
    var saved: Binding<Bool>
    //var userId: String
    @State private var front: String
    @State private var back: String
    @State private var tip: String
    @StateObject var vm = ViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(baralho: Binding<Baralho>, indexCard: Int, saved: Binding<Bool>) {
        self.baralho = baralho
        self.indexCard = indexCard
        self.saved = saved
        self._front = State(initialValue: baralho.wrappedValue.cards[indexCard].front)
        self._back = State(initialValue: baralho.wrappedValue.cards[indexCard].back)
        self._tip = State(initialValue: baralho.wrappedValue.cards[indexCard].tip!)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text("Editando")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                Spacer()
                HStack{
                    Text("Frente:")
                        .font(.custom("PT_Sans", size: 18, relativeTo: .headline))
                        .foregroundColor(.white)
                        .padding(.trailing, 10)
                    Spacer()
                    TextField("", text: $front)
                        .font(.custom("PT_Sans", size: 18, relativeTo: .headline))
                        .foregroundColor(.black)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 10)
                HStack{
                    Text("Trás:")
                        .font(.custom("PT_Sans", size: 18, relativeTo: .headline))
                        .foregroundColor(.white)
                        .padding(.trailing, 25)
                        .padding(.bottom, 100)
                    TextField("", text: $back, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.trailing, 20)
                HStack{
                    Text("Dica:")
                        .font(.custom("PT_Sans", size: 18, relativeTo: .headline))
                        .foregroundColor(.white)
                        .padding(.trailing, 25)
                        .padding(.bottom, 100)
                    TextField("", text: $tip, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.trailing, 20)
                Button(action: {
                    if (baralho.wrappedValue.cards[indexCard].front != front || baralho.wrappedValue.cards[indexCard].back != back || baralho.wrappedValue.cards[indexCard].tip != tip) {
                        var new_deck = baralho.wrappedValue
                        new_deck.cards[indexCard].front = front
                        new_deck.cards[indexCard].back = back
                        new_deck.cards[indexCard].tip = tip
                        baralho.wrappedValue = new_deck
                        vm.editDeck(baralho: new_deck, userId: baralho.wrappedValue.userId)
                        saved.wrappedValue = true
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Salvar")
                        .font(.custom("PT_Sans", size: 18, relativeTo: .headline))
                        .frame(width: 320, height: 30)
                }
                
                .buttonStyle(.bordered)
                .background(.green)
                .foregroundColor(.white)
                .padding(.top, 40)
                .cornerRadius(5)
                .shadow(radius: 10)
                Spacer()
            }
            .padding(25)
            .background(LinearGradient(colors: [Color("DarkBlue"), Color("LightBlue")], startPoint: .bottom, endPoint: .top))
//            if (vm.isLoading) {
//                Rectangle()
//                    .frame(width: 100, height: 100)
//                    .foregroundColor(.white)
//                    .cornerRadius(20)
//                    .overlay(ProgressView())
//            } else {
//                VStack {
//
//                }.onAppear() {
//                    if (started_loading && !vm.isLoading) {
//                        self.presentationMode.wrappedValue.dismiss()
//                    }
//                }
//            }
        }
        .ignoresSafeArea()
    }
}

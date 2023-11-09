//
//  HomeView.swift
//  RememberApp
//
//  Created by Student23 on 09/11/23.
//


import SwiftUI

struct HomeView: View {
    @StateObject var vm: ViewModel = ViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Baralhos").font(.largeTitle).foregroundColor(.white).shadow(radius: 3)
                    
                    Spacer().frame(height: 100)
                    
                    
                    NavigationLink {
                        CreateNewView(userId: "4321")
                    } label: {
                        HStack {
                            Text("Novo").foregroundColor(Color("DarkBlue"))
                            Image(systemName: "plus.app.fill").font(.title).foregroundColor(Color("DarkBlue"))
                        }.padding().frame(width: 300).background(.white).cornerRadius(5)
                    }
                    
                    Spacer().frame(height: 40)
                    
                    VStack {
                        ForEach(vm.baralhos, id: \._id) { baralho in
                            HStack {
                                Text(baralho.subject).padding([.trailing]).foregroundColor(Color("DarkBlue"))
                                
                                Spacer()
                                
                                NavigationLink {
                                    EditDeckView(baralho: $vm.baralhos[0])
                                } label: {
                                    Image(systemName: "pencil").font(.title).foregroundColor(Color("DarkBlue"))
                                }
                                
                                NavigationLink {
                                    PlayView(baralho: baralho)
                                } label: {
                                    Image(systemName: "play.fill").font(.title).foregroundColor(Color("DarkBlue"))
                                }
                            }.padding().frame(width: 300).background(.white).cornerRadius(5)
                        }
                    }.onAppear {
                        vm.getUserDecks(userId: "4321")
                    }
                }.padding()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).background(LinearGradient(colors: [Color("DarkBlue"), Color("LightBlue")], startPoint: .bottom, endPoint: .top))
                .gesture(
                    DragGesture()
                        .onChanged { _ in
                            vm.getUserDecks(userId: "4321")
                        }
                )
            
        }.tint(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

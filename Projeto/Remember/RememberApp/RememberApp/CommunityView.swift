//
//  CommunityView.swift
//  RememberApp
//
//  Created by Student23 on 09/11/23.
//

import SwiftUI


struct CommunityView: View {
    //var baralhos: [Baralho] = []
    @State var selectors = ["Baralhos do Momento", "Matemática", "Artes", "Ciências"]
    var nomes = ["Rafael", "Luís", "Breno", "Kaynã", "Vinicius", "Eduardo", "Zé Lezin", "Gabigol", "Neymar Jr.", "Tiquinho Soares"].shuffled()
    
    var colors: [Color] = [.green, .red, .indigo, .black, .pink,.green, .red, .indigo, .black, .pink].shuffled()
    @StateObject var vm = ViewModel()
    
    @State public var UPD: [Bool] = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
    
    @State public var COUNT: [Int] = [4981,1983,1712,1380,1112,939,788,609,575,550,466,390,203,119,13]
    var body: some View {
        NavigationStack {
            VStack{
                Spacer().frame(height: 20)
                Text("Comunidade")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .shadow(radius: 3)
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(selectors, id: \.self) { selector in
                            
                            Button {
                                
                            } label : {
                                Text(selector)
                                    .padding(5)
                                    .foregroundColor(Color("DarkBlue"))
                                    .padding(.all,4)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.white)                            .shadow(radius: 3)
                                    )
                            }
                        }
                    }
                    .padding(.top)
                }
                Spacer().frame(height: 20)
                ScrollView(showsIndicators: false){
                    ForEach(vm.baralhos, id: \._id) { baralho in
                        VStack {
                                NavigationLink {
                                    PlayView(baralho: baralho)
                                } label: {
                                    ZStack{

                                    Rectangle()
                                        .frame(width: 250,height: 250)
                                        .foregroundColor(colors[vm.baralhos.firstIndex(of: baralho)!])
                                        //.foregroundColor(.red)
                                    Text(baralho.subject)
                                        .foregroundColor(.white)
                                        .shadow(radius:1)
                                }
                            }
                            HStack{
                                Image(systemName: "person.fill").foregroundColor(.white)
                                Text(baralho.userId == "4321" ? "Rafael Araújo" : nomes[vm.baralhos.firstIndex(of: baralho)!]).foregroundColor(.white)
                                Spacer()
                                Button{
                                    if (UPD[vm.baralhos.firstIndex(of: baralho)!] == false) {
                                        COUNT[vm.baralhos.firstIndex(of: baralho)!]+=1
                                    }
                                    else{
                                        COUNT[vm.baralhos.firstIndex(of: baralho)!]-=1
                                    }
                                    
                                    UPD[vm.baralhos.firstIndex(of: baralho)!].toggle()
                                }label: {
                                    HStack {
                                        if (UPD[vm.baralhos.firstIndex(of: baralho)!] == true) {
                                            Text(String(COUNT[vm.baralhos.firstIndex(of: baralho)!]))
                                                .foregroundColor(.green)
                                            Image("Upped")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        } else {
                                            Text(String(COUNT[vm.baralhos.firstIndex(of: baralho)!]))
                                                .foregroundColor(.white)
                                            Image("UpDeck")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        }
                                    }
                                }
                                
                            }
                            .padding(.leading)
                            .padding(.trailing)
                            .frame(width: 280)
                        }
                    }
                }
            }.background(LinearGradient(colors: [Color("DarkBlue"), Color("LightBlue")], startPoint: .bottom, endPoint: .top)).onAppear {
                vm.getCommunityDecks()
            }
        }.tint(.white)
    }
    }
    
    struct CommunityView_Preview: PreviewProvider {
        static var previews: some View {
            CommunityView()
        }
    }


//
//  ProfileView.swift
//  RememberApp
//
//  Created by Student23 on 09/11/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Spacer().frame(height: 20)
                Text("Rafael Araújo")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .shadow(radius: 1)
                    .font(.custom("PT-Sans", size: 36, relativeTo: .headline))
                VStack {
                    Spacer().frame(height: 25)
                    Image("user")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                    VStack {
                        Spacer().frame(height: 50)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.white)
                            .opacity(0.1)
                        HStack {
                            Text("Email") .font(.custom("PT-Sans", size: 18, relativeTo: .headline)).foregroundColor(.white)
                            Spacer()
                            Text(verbatim: "araujorafael9201@gmail.com").font(.custom("PT-Sans", size: 18, relativeTo: .headline))
                                .foregroundColor(.white).underline()
                        }
                        .padding()
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.white)
                            .opacity(0.1)
                        HStack {
                            Text("Número") .font(.custom("PT-Sans", size: 18, relativeTo: .headline)).foregroundColor(.white)
                            Spacer()
                            Text("+55 (84) 12345-6789") .font(.custom("PT-Sans", size: 18, relativeTo: .headline)).foregroundColor(.white)
                        }
                        .padding()
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.white)
                            .opacity(0.1)
                        
                        Spacer().frame(height: 40)
                        
                        VStack {
                            Text("Seus baralhos")
                                .font(.system(size: 28)).font(.custom("PT-Sans", size: 18, relativeTo: .headline)).foregroundColor(.white)
                            
                            
                            Spacer().frame(height: 25)
                            // baralhos
                            
                            ForEach(vm.baralhos, id: \._id) { baralho in
                                HStack {
                                    Text(baralho.subject).padding([.trailing]).foregroundColor(Color("DarkBlue")).font(.custom("PT-Sans", size: 16, relativeTo: .headline))
                                    
                                    Spacer()
                                    
                                    NavigationLink {
                                        PlayView(baralho: baralho)
                                    } label: {
                                        Image(systemName: "play.fill").font(.title).foregroundColor(Color("DarkBlue"))
                                    }
                                }.padding().background(.white).cornerRadius(5)
                                
                                Spacer().frame(height: 25)
                            }
                            // fim baralhos
                        }
                    }
                }.padding().onAppear {
                    vm.getUserDecks(userId: "4321")
                }
            }.background(LinearGradient(colors: [Color("DarkBlue"), Color("LightBlue")], startPoint: .bottom, endPoint: .top))
        }.tint(.white)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

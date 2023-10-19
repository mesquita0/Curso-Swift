//
//  ContentView.swift
//  API
//
//  Created by Student13 on 19/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var char = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.gray)
                ScrollView {
                    VStack {
                        Text("Rick and Morty Characters")
                            .font(.system(size: 32))
                            .foregroundColor(.white)
                            .padding(.top, 60)
                            .padding(.bottom, 20)
                        ForEach(char.characters) { character in
                            NavigationLink(destination: CharacterDetails(character: character)) {
                                HStack {
                                    AsyncImage(url: URL(string: character.image!)) { phase in
                                        switch phase {
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFit()
                                            
                                        default:
                                            Rectangle()
                                                .fill(.clear)
                                        }
                                    }
                                    .frame(width: 60, height: 60)
                                    .padding(.leading, 10)
                                    .padding(.trailing, 10)
                                    Text(character.name)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
        .onAppear() {
            char.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

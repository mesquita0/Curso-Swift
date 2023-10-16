//
//  ContentView.swift
//  Spotify
//
//  Created by Student13 on 16/10/23.
//

import SwiftUI

struct ContentView: View {
    private let songs: [Song] = [
        Song(id: 1, name: "Melhor só", artist: "KayBlack, Baco Exu do Blues", cover: "https://i.scdn.co/image/ab67616d0000b273167c4f8605353a084d574b05"),
        Song(id: 2, name: "Conecxões de Máfia", artist: "Matuê, Rich The Kid", cover: "https://i.scdn.co/image/ab67616d0000b2739935bba90dee253e77d8f9ad"),
        Song(id: 3, name: "Vestido da Fendi", artist: "KayBlack, Marquinho", cover: "https://i.scdn.co/image/ab67616d0000b27353c5973be711441f03fd2977"),
        Song(id: 4, name: "teste 4", artist: "teste 4", cover: ""),
        Song(id: 5, name: "teste 5", artist: "teste 5", cover: ""),
        Song(id: 6, name: "teste 6", artist: "teste 6", cover: ""),
        Song(id: 7, name: "teste 7", artist: "teste 7", cover: ""),
        Song(id: 8, name: "teste 8", artist: "teste 8", cover: ""),
        Song(id: 9, name: "teste 9", artist: "teste 9", cover: ""),
        Song(id: 10, name: "teste 10", artist: "teste 10", cover: ""),
    ]
    
    private let suggestions: [Suggestion] = [
        Suggestion(id: 1, albumName: "Scorpion", albumCover: "https://i.scdn.co/image/ab67616d0000b273f907de96b9a4fbc04accc0d5"),
        Suggestion(id: 2, albumName: "Views", albumCover: "https://i.scdn.co/image/ab67616d0000b2739416ed64daf84936d89e671c"),
        Suggestion(id: 3, albumName: "AstroWorld", albumCover: "https://i.scdn.co/image/ab67616d0000b273072e9faef2ef7b6db63834a3"),
        Suggestion(id: 4, albumName: "Album 4", albumCover: ""),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color("background"), .black], startPoint: .top, endPoint: .center)
                ScrollView {
                    VStack {
                        Image("cover")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.leading, 30)
                            .padding(.trailing, 30)
                            .padding(.bottom, 20)
                        Text("HackaFM")
                            .font(.system(size: 25))
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            .padding(.leading, 15)
                        HStack {
                            Image("cover")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text("HackaSong")
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                        .padding(.bottom, 20)
                        ForEach(songs) { song in
                            NavigationLink(destination: SongDetails(song: song)) {
                                HStack {
                                    AsyncImage(url: URL(string: song.cover)) { phase in
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
                                    .padding(.trailing, 10)
                                    VStack {
                                        Text(song.name)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.white)
                                        Text(song.artist)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.white)
                                    }
                                    Spacer()
                                    Image(systemName: "ellipsis")
                                }
                                .padding(.leading, 10)
                                .padding(.bottom, 10)
                            }
                        }
                        Text("Sugeridos")
                            .font(.system(size: 30))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            .padding(.leading, 5)
                            .padding(.top, 90)
                            .padding(.bottom, 20)
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(suggestions) { suggestion in
                                    VStack {
                                        AsyncImage(url: URL(string: suggestion.albumCover)) { phase in
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
                                        .frame(width: 125, height: 125)
                                        Text(suggestion.albumName)
                                            .foregroundColor(.white)
                                    }
                                    .padding(.trailing, 15)
                                }
                            }
                        }
                        
                    }
                    .padding(.top, 70)
                    .padding(.bottom, 20)
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

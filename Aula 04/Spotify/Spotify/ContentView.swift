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
        Song(id: 4, name: "Mais Um Voo", artist: "Teto", cover: "https://i.scdn.co/image/ab67616d0000b2732041e7a067948d9ac6b8561b"),
        Song(id: 5, name: "Flow Espacial", artist: "Teto, WIU, Matuê", cover: "https://i.scdn.co/image/ab67616d0000b273fbe85e19226e3c40fe390dae"),
        Song(id: 6, name: "Bellyache", artist: "Billie Eilish", cover: "https://i.scdn.co/image/ab67616d0000b273a9f6c04ba168640b48aa5795"),
        Song(id: 7, name: "The Hills", artist: "The Weeknd", cover: "https://i.scdn.co/image/ab67616d0000b27357b02e479a9f7d11ac7e60d6"),
        Song(id: 8, name: "Engana Dizendo Que Ama", artist: "Veigh, Tz da Coronel, Toledo, Nagalli", cover: "https://i.scdn.co/image/ab67616d0000b273ce0947b85c30490447dbbd91"),
        Song(id: 9, name: "Não faz isso Comigo não", artist: "Tz da Coronel, CalliCartel", cover: "https://i.scdn.co/image/ab67616d0000b273759f4744db303c9efb5d7c0a"),
        Song(id: 10, name: "Meca Cereja", artist: "Vulgo FK, MC Cebezinho, KayBlack", cover: "https://i.scdn.co/image/ab67616d0000b273172d4424fbc8a3d8358d7039"),
    ]
    
    private let suggestions: [Suggestion] = [
        Suggestion(id: 1, albumName: "Scorpion", albumCover: "https://i.scdn.co/image/ab67616d0000b273f907de96b9a4fbc04accc0d5"),
        Suggestion(id: 2, albumName: "Views", albumCover: "https://i.scdn.co/image/ab67616d0000b2739416ed64daf84936d89e671c"),
        Suggestion(id: 3, albumName: "AstroWorld", albumCover: "https://i.scdn.co/image/ab67616d0000b273072e9faef2ef7b6db63834a3"),
        Suggestion(id: 4, albumName: "÷", albumCover: "https://i.scdn.co/image/ab67616d0000b273ba5db46f4b838ef6027e6f96"),
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
                            NavigationLink(destination: SongDetails(songs: songs, firstSongId: song.id)) {
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
                                        .foregroundColor(.white)
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

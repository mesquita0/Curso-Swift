//
//  SongDetails.swift
//  Spotify
//
//  Created by Student13 on 16/10/23.
//

import SwiftUI

struct SongDetails: View {
    var songs: [Song]
    var firstSongId: Int
    @State var id: Int = -1
    
    var body: some View {
        let song = songs.first(where: {song in song.id == (id == -1 ? firstSongId : id)})!
        
        ZStack {
            LinearGradient(colors: [Color("background"), .black], startPoint: .top, endPoint: .center)
            VStack {
                Spacer()
                AsyncImage(url: URL(string: song.cover)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                        
                    default:
                        Rectangle()
                            .fill(.clear)
                            .scaledToFit()
                    }
                }
                Text(song.name)
                    .font(.system(size: 25))
                    .bold()
                    .foregroundColor(.white)
                Text(song.artist)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Spacer()
                HStack {
                    Image(systemName: "shuffle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    Button {
                        id = id == -1 ? firstSongId : id
                        id = id-1 >= 1 ? id-1 : songs.count
                    } label: {
                        Image(systemName: "backward.end.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                    }
                    Image(systemName: "play.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    Button {
                        id = id == -1 ? firstSongId : id
                        id = id+1 <= songs.count ? id+1 : 1
                    } label: {
                        Image(systemName: "forward.end.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                    }
                    Image(systemName: "repeat")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

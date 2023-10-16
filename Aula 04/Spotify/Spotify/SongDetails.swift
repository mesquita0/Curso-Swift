//
//  SongDetails.swift
//  Spotify
//
//  Created by Student13 on 16/10/23.
//

import SwiftUI

struct SongDetails: View {
    var song: Song
    private let icons = ["shuffle", "backward.end.fill", "play.fill", "forward.end.fill", "repeat"]
    
    var body: some View {
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
                    ForEach(icons, id: \.self) { icon in
                        Image(systemName: icon)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                    }
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

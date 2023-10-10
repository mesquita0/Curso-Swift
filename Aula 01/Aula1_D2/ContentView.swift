//
//  ContentView.swift
//  Aula 1
//
//  Created by Student13 on 09/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("Truck")
                .resizable()
                .scaledToFit()
            Spacer()
            Image("Truck")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .foregroundColor(.yellow)
                .overlay(
                    Text("HackaTruck")
                        .padding(.top, 50)
                        .foregroundColor(.blue)
                        .font(.title)
                        .bold()
                    , alignment: .top
                )
            Spacer()
            HStack {
                Text("Maker")
                    .foregroundColor(.yellow)
                    .font(.system(size: 20))
                Text("Space")
                    .foregroundColor(.red)
                    .font(.system(size: 20))
            }
            .frame(width: 230.0, height: 130.0)
            .background(Color.black)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
            Text("HackaTruck")
                .foregroundColor(.blue)
                .bold()
                .font(.title)
            HStack {
                Text("Maker")
                    .foregroundColor(.yellow)
                Text("Space")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

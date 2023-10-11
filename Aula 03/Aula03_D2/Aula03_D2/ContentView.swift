//
//  ContentView.swift
//  Aula03_D2
//
//  Created by Student13 on 11/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: EdilsonView()) {
                    Text("Modo 1")
                }
                NavigationLink(destination: GetNameView()) {
                    Text("Modo 2")
                }
                NavigationLink(destination: EdilsonView()) {
                    Text("Modo 3")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

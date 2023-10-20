//
//  ContentView.swift
//  Cripto
//
//  Created by Student13 on 20/10/23.
//

import SwiftUI

struct ContentView: View {
    var menus = ["Assets", "Rates", "Exchanges", "Markets", "Candles"]
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: AssetsView()) {
                    Text("Assets")
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

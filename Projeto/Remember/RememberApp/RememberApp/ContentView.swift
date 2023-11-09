//
//  ContentView.swift
//  RememberApp
//
//  Created by Student23 on 09/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            TabView() {
                HomeView().tabItem {
                    Label("Home", systemImage: "house.fill").foregroundColor(.white)
                }
                CommunityView().tabItem {
                    Label("Comunidade", systemImage: "globe")
                }
                ProfileView().tabItem {
                    Label("Perfil", systemImage: "person")
                }
            }.onAppear() {
                UITabBar.appearance().backgroundColor = .white
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

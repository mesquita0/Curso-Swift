//
//  ContentView.swift
//  Aula03_D1
//
//  Created by Student13 on 11/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            ListItemsView()
            .badge(2)
            .tabItem {
                Label("Home", systemImage: "figure.stand.line.dotted.figure.stand")
            }
            SearchView()
            .tabItem {
                Label("", systemImage: "magnifyingglass")
            }
            PhotosView()
            .tabItem {
                Label("Photos", systemImage: "photo")
            }
            MessagesView()
            .badge("!")
            .tabItem {
                Label("Messages", systemImage: "")
            }
            ProfileView()
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

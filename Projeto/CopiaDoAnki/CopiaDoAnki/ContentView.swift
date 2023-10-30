//
//  ContentView.swift
//  CopiaDoAnki
//
//  Created by Student23 on 30/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView() {
                HomeView().tabItem {
                    Label("Home", systemImage: "home")
                }
                CommunityView().tabItem {
                    Label("Community", systemImage: "globe")
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

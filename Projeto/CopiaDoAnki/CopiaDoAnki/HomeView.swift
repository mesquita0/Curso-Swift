//
//  HomeView.swift
//  CopiaDoAnki
//
//  Created by Student23 on 30/10/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                CreateNewView()
            } label: {
                Text("Criar")
            }
            
            NavigationLink {
                EditView()
            } label: {
                Text("Editar")
            }
            
            NavigationLink {
                PlayView()
            } label: {
                Text("Jogar")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  ContentView.swift
//  Aula1_D3
//
//  Created by Student13 on 09/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            Image("Truck_2")
                .resizable()
                .frame(width: 700, height: UIScreen.main.bounds.height)
                .opacity(0.2)
            VStack {
                Text("Bem vindo, \(name)")
                        .font(.title)
                        .bold()
                        .padding(.bottom, 20)
                TextField("Entre seu nome", text: $name)
                        .multilineTextAlignment(.center)
                Spacer()
                VStack  {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                    Image("Truck_1")
                        .resizable()
                        .scaledToFit()
                }
                .frame(width: 200, height: 200)
                .padding(.top, 170)
                Spacer()
                Button("Entrar") {
                    showingAlert = true
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("ALERTA!")
                        .bold(), message: Text("Você irá iniciar o desafio de aula agora"), dismissButton: .default(Text("Vamos lá!").bold()))
                }
                .padding(.bottom, 70)
            }
            .padding(.top, 70)
        }
        .ignoresSafeArea()
        .padding(.top, 1)
        .padding(.bottom, 5)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

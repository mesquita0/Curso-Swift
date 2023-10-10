//
//  ContentView.swift
//  Calculadora IMC
//
//  Created by Student13 on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var pesoStr = ""
    @State private var alturaStr = ""
    @State private var peso:Double? = 0.0
    @State private var altura:Double? = 0.0
    @State private var imc = 0.0
    @State private var classificacao = ""
    @State private var cor = "default"
    @State private var mostrarClassificacao = true
    
    var body: some View {
        ZStack {
            Color(cor).ignoresSafeArea()
            VStack {
                Text("Calculadora de IMC")
                    .font(.system(size: 35))
                TextField("Peso em kg", text: $pesoStr)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.center)
                        .padding()
                TextField("Altura em cm", text: $alturaStr)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.center)
                        .padding()
                Button("Calcular") {
                    peso = Double(pesoStr)
                    altura = Double(alturaStr)
                    if (peso != nil && altura != nil && altura! != 0 && peso! != 0) {
                        imc = (peso!) / pow((altura!/100), 2)
                        switch (imc) {
                        case ..<18.5:
                            classificacao = "Baixo peso"
                            cor = "baixo-peso"
                        case 18.5..<25:
                            classificacao = "Normal"
                            cor = "normal"
                        case 25..<30:
                            classificacao = "Sobrepeso"
                            cor = "sobrepeso"
                        default:
                            classificacao = "Obesidade"
                            cor = "obesidade"
                        }
                        mostrarClassificacao = true
                    }
                }
                    .buttonStyle(.bordered)
                    .background(.blue)
                    .foregroundColor(.white)
                Spacer()
                Text(classificacao)
                    .opacity(mostrarClassificacao ? 1 : 0)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                Spacer()
                Image("Tabela")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

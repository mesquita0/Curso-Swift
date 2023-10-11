//
//  GetNameView.swift
//  Aula03_D2
//
//  Created by Student13 on 11/10/23.
//

import SwiftUI

struct GetNameView: View {
    @State private var name = ""
    
    var body: some View {
            VStack {
                TextField("Digite seu nome", text: $name)
                    .padding(.leading, 30)
                Text("Estamos percorrendo um caminho \(name)")
                NavigationLink(destination: UseNameView(name: self.name)) {
                    Text("Acessar Tela")
                }
            }
    }
}

struct GetNameView_Previews: PreviewProvider {
    static var previews: some View {
        GetNameView()
    }
}

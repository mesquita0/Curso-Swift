//
//  ContentView.swift
//  Predios
//
//  Created by Student13 on 26/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(vm.faculdades.count)")
                ForEach(vm.faculdades) { facul in
                    NavigationLink(destination: DetalheFaculdade(faculdade: facul)) {
                        Text(facul.nomeFaculdade!)
                    }
                }
            }
            .onAppear() {
                vm.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  APIViewModel.swift
//  Predios
//
//  Created by Student13 on 26/10/23.
//

import Foundation

struct Curso: Decodable {
    let nomeCurso: String?
    let area: String?
}

struct Predio: Decodable {
    let nomePredio: String?
    let cursos: [Curso]?
}

struct Faculdade: Decodable, Identifiable {
    let id: String
    let nomeFaculdade: String?
    let cidade: String?
    let predios: [Predio]?
}

class ViewModel: ObservableObject {
    
    @Published var faculdades: [Faculdade] = []

    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/lerFaculdades") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Faculdade].self, from: data)
                
                DispatchQueue.main.async {
                    self?.faculdades = parsed
                }
            } catch {
                print(error)
                print("djashfua")
            }
        }
        
        task.resume()
    }
}

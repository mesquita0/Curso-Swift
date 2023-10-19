//
//  ViewModel.swift
//  API
//
//  Created by Student13 on 19/10/23.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
    
    func fetch() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode(Result.self, from: data)
                
                DispatchQueue.main.async {
                    self?.characters = parsed.results
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}

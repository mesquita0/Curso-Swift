//
//  APIViewModel.swift
//  Cripto
//
//  Created by Student13 on 20/10/23.
//

import Foundation

struct CoinDetails: Decodable, Identifiable {
    var id: String?
    var rank: String?
    var symbol: String?
    var name: String?
    var supply: String?
    var maxSupply: String?
    var marketCapUsd: String?
    var volumeUsd24Hr: String?
    var priceUsd: String?
}

struct API_Details: Decodable {
    var data: CoinDetails
}

struct CoinMenu: Decodable, Identifiable {
    var id: String?
    var rank: String?
    var symbol: String?
}


struct API_Menus: Decodable {
    var data: [CoinMenu]
}


class APIViewModel: ObservableObject {
    
    @Published var coins: [CoinMenu] = []
    @Published var coinDetails: CoinDetails = CoinDetails()
    
    func fetch() {
        guard let url = URL(string: "https://api.coincap.io/v2/assets") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                
                let decodificado = try JSONDecoder().decode(API_Menus.self, from: data)
                
                DispatchQueue.main.async {
                    self?.coins = decodificado.data
                }
            } catch {
                print(error)
            }
            
        }
        
        task.resume()
    }
    
    func fetch(byId: String) {
        guard let url = URL(string: "https://api.coincap.io/v2/assets/\(byId)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                
                let decodificado = try JSONDecoder().decode(API_Details.self, from: data)
                
                DispatchQueue.main.async {
                    self?.coinDetails = decodificado.data
                }
            } catch {
                print(error)
            }
            
        }
        
        task.resume()
    }
    
}

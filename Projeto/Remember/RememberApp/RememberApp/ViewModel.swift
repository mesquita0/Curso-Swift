//
//  ViewModel.swift
//  RememberApp
//
//  Created by Student23 on 09/11/23.
//


import Foundation

struct Baralho: Codable, Equatable {
    var _id: String
    var _rev: String
    var subject: String
    var cards: [Carta]
    var userId : String
}

struct Carta: Codable, Hashable {
    var front: String
    var back: String
    var tip: String?
}

private struct DeckCreator: Codable {
    var msg: String
    var userId: String
}

private struct DeckEditor: Codable {
    var _id: String
    var _rev: String
    var cards: [Carta]
    var userId: String
    var subject: String
}

class ViewModel: ObservableObject {
    
    @Published var baralhos: [Baralho] = []
    
    private func fetch(endpoint: String) {
        guard let url = URL(string: "http://192.168.128.250:1880/\(endpoint)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Baralho].self, from: data)
                
                DispatchQueue.main.async {
                    self?.baralhos = parsed
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func getUserDecks(userId: String) {
        fetch(endpoint: "userDecks/\(userId)")
    }
    
    func getCommunityDecks() {
        fetch(endpoint: "communityDecks")
    }
    
    func createDeck(msg: String, userId: String) {
        guard let url = URL(string: "http://192.168.128.250:1880/createDeck") else {
            print("Failed to get url")
            return
        }
        
        guard let encoded = try? JSONEncoder().encode(DeckCreator(msg: msg, userId: userId)) else {
            print("Failed to encode order")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling POST")
                print(error!)
                return
            }
//            guard let data = data else {
//                print("Error: Did not receive data")
//                return
//            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
//            do {
//                let parsed = try JSONDecoder().decode(Baralho.self, from: data)
//            } catch {
//                print("Error: Trying to convert JSON data to string")
//                return
//            }
        }.resume()
    }
    
    func editDeck(baralho: Baralho, userId: String) {
        guard let url = URL(string: "http://192.168.128.250:1880/editDeck") else {
            print("Failed to get url")
            return
        }
        
        guard let encoded = try? JSONEncoder().encode(DeckEditor(_id: baralho._id, _rev: baralho._rev, cards: baralho.cards, userId: userId, subject: baralho.subject)) else {
            print("Failed to encode order")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling POST")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
                do {
                    let parsed = try JSONDecoder().decode(Baralho.self, from: data)
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            }
        }.resume()
    }
}

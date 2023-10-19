//
//  Model.swift
//  API
//
//  Created by Student13 on 19/10/23.
//

import Foundation

struct Origin: Decodable {
    let name: String?
}

struct Location: Decodable {
    let name: String?
}

struct Character: Decodable, Identifiable {
    let id: Int
    let name: String
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Origin?
    let location: Location?
    let image: String?
}

struct Result: Decodable {
    let results: [Character]
}

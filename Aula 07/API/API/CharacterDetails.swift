//
//  CharacterDetails.swift
//  API
//
//  Created by Student13 on 19/10/23.
//

import SwiftUI

struct CharacterDetails: View {
    var character: Character
    var informations: [String: String?]
    var infs: [String]
    
    init (character: Character) {
        self.character = character
        infs = ["Name", "Status", "Species", "Type", "Gender", "Origin", "Location"]
        informations = [
            "Name": character.name,
            "Status": character.status,
            "Species": character.species,
            "Type": character.type,
            "Gender": character.gender,
            "Origin": character.origin == nil ? nil : character.origin!.name,
            "Location": character.origin == nil ? nil : character.origin!.name
        ]
        informations = informations.filter({$0.value != nil})
    }
    
    var body: some View {
        ZStack {
            Color(.gray)
            VStack {
                Spacer()
                AsyncImage(url: URL(string: character.image!)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                        
                    default:
                        Rectangle()
                            .fill(.clear)
                    }
                }
                .padding(.top, 20)
                ForEach(infs, id:\.self) { inf in
                    
                    if(informations[inf] != ""){
                        Text("\(inf): \(informations[inf]!!)")
                            .font(.system(size: 20))
                            .padding(.top, 3)
                            .foregroundColor(.white)
                    }
                    
                    
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

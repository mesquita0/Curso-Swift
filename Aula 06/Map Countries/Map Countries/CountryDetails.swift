//
//  CountryDetails.swift
//  Map Countries
//
//  Created by Student13 on 18/10/23.
//

import SwiftUI

struct CountryDetails: View {
    var location: Location
    
    var body: some View {
        Text(location.name)
        AsyncImage(url: URL(string: location.flag)) { phase in
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
        .frame(width: 60, height: 60)
        Text(location.description)
    }
}

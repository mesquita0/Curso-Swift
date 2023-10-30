//
//  DetalheFaculdade.swift
//  Predios
//
//  Created by Student13 on 26/10/23.
//

import SwiftUI

struct DetalheFaculdade: View {
    var faculdade: Faculdade
    var body: some View {
        Text(faculdade.nomeFaculdade!)
    }
}

//
//  EditView.swift
//  CopiaDoAnki
//
//  Created by Student23 on 30/10/23.
//

import SwiftUI

struct EditView: View {
    var body: some View {
        NavigationLink {
            EditCardView()
        } label: {
            Text("Editar carta")
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}

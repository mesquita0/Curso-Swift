//
//  ListItemsView.swift
//  Aula03_D1
//
//  Created by Student13 on 11/10/23.
//

import SwiftUI

struct ListItemsView: View {
    private let items = ["1", "2", "3", "4", "5", "6", "7", "8",
                         "9", "10", "11", "12", "13", "14", "15"]
    
    var body: some View {
        List(items, id:\.self){ item in
                Text("Item \(item)")
                .padding(.bottom, 10)
        }
    }
}

struct ListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemsView()
    }
}

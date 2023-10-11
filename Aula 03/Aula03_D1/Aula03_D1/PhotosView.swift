//
//  PhotosView.swift
//  Aula03_D1
//
//  Created by Student13 on 11/10/23.
//

import SwiftUI

struct PhotosView: View {
    private let images = ["trash.fill", "folder.fill", "externaldrive.fill", "archivebox.fill", "terminal.fill", "calendar"]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(images, id: \.self) { image in
                    Image(systemName: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                }
            }
        }
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}

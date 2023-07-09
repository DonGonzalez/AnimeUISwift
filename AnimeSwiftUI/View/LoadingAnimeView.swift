//
//  LoadingAnimeView.swift
//  AnimeSwiftUI
//
//  Created by Robert B on 09/07/2023.
//

import Foundation
import SwiftUI

struct LoadingAnimeImage: View {
    
    var imageURL: String
    var imageHeight: CGFloat
    var imageWidth: CGFloat
    
    var body: some View{
        if URL(string: imageURL) != nil {
            AsyncImage(url: URL(string: imageURL)){ phase in
                if let image = phase.image {
                    image.resizable()
                        .frame(width: imageWidth, height: imageHeight)
                        .clipped()
                } else if phase.error != nil {
                    Color.red
                        .frame(width: imageWidth, height: imageHeight)
                } else {
                    ProgressView()
                }
            }
        } else {
            Image(systemName: "photo")
                .renderingMode(.original)
                .resizable()
                .frame(width: imageWidth, height: imageHeight)
                .aspectRatio(contentMode: .fit)
        }
    }
}


//
//  AnimeCell.swift
//  AnimeSwiftUI
//
//  Created by Robert B on 09/07/2023.
//

import Foundation
import SwiftUI

struct AnimeCell :View {
    
    var data: AnimeData
    
    var body: some View {
        HStack(alignment: .center,spacing: 20) {
            LoadingAnimeImage(imageURL: data.attributes.posterImage.small,imageHeight: 150, imageWidth: 120)
                .scaledToFit()
                VStack (alignment: .center, spacing: 20){
                    Text(data.attributes.canonicalTitle ?? "")
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                    Text("Episode: \(data.attributes.episodeCount ?? 0)")
                }
            }
        }
    }
    
    
  




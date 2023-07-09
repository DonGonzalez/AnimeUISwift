//
//  AnimeDetailView.swift
//  AnimeSwiftUI
//
//  Created by Robert B on 09/07/2023.
//

import Foundation
import SwiftUI

struct AnimeDetailView: View {
    var data: AnimeData
    
    var body: some View{
       
            ScrollView{
                VStack(alignment: .center, spacing: 10){
                    LoadingAnimeImage(imageURL: data.attributes.posterImage.original, imageHeight: 300, imageWidth: 200)
                        .scaledToFit()
                        .padding(.top, 10)
                    Text(data.attributes.canonicalTitle ?? "")
                        .bold()
                    Text(data.attributes.createdAt ?? "")
                    Text(data.attributes.description ?? "")
                        .multilineTextAlignment(.leading)
                        .padding(CGFloat(10))
                }
                
            }.modifier(Menagers(navigationTitle: "AnimeDetail"))
        
    }
}

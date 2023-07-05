//
//  ContentView.swift
//  AnimeSwiftUI
//
//  Created by Robert B on 17/06/2023.
//

import SwiftUI

struct MainAnimeView: View {
    
    @EnvironmentObject var navigationViewModyfier: NavigationManager    
    @StateObject var viewModel = ViewModel()

    var body: some View {
        NavigationStack {
            AnimeList(viewModel: viewModel)
            .modifier(Menagers(navigationTitle: "Anime"))
            .toolbar {
                Button {
                    print("click")
                } label: {
                    Label("", systemImage: "folder.badge.plus")
                }
                Button {
                    print("click")
                } label: {
                    Label("", systemImage: "perspective")
                }
            }
        }
    }
}

struct AnimeList: View {
    
    @State private var showingAlert = false
    
    @ObservedObject var viewModel: ViewModel
 
    
    var body: some View{
        List {
            ForEach(viewModel.animeData,id: \.id){index in
                HStack {
                    Image(systemName: "photo")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .aspectRatio(contentMode: .fit)
                    VStack {
                        Text(index.attributes.canonicalTitle ?? "")
                        Text("Episode: \(index.attributes.episodeCount ?? 0)")
                    }
                }
            }
        }
        
        .alert("Message", isPresented: $showingAlert) {
            
        } message: {
                Text( viewModel.messageError?.message ?? "empty")
            }

}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainAnimeView()
    }
}

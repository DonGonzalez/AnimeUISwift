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
                NavigationLink {
                    AnimeDetailView(data: index)
                } label: {
                    AnimeCell(data: index)
                }
            }
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainAnimeView()
    }
}

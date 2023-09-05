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
        ZStack{
            NavigationStack {
                AnimeList(viewModel: viewModel)
                    .modifier(Menagers(navigationTitle: "Anime"))
                    .toolbar {
                        Button {
                            print("click")
                            withAnimation(.spring()) {
                            }
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
}

struct AnimeList: View {
    
    
    
    //  @State  var popupState:Bool
    @EnvironmentObject var popupMenager: PopupMenager
    
    @ObservedObject var viewModel: ViewModel
    
   
    @State var popupData: PopupData = (false, "")
    typealias PopupData = (isPresented: Bool, error: String)
    
    var body: some View{
        ZStack{
            List {
                ForEach(viewModel.animeData,id: \.id){index in
                    NavigationLink {
                        AnimeDetailView(data: index)
                    } label: {
                        AnimeCell(data: index)
                    }
                }
            }
            .onChange(of: viewModel.showingAlert) { newValue in
                popupData.isPresented = newValue
           }
            .onChange(of: viewModel.messageError?.message ?? "") { newValue in
                popupData.error = newValue
           }
            
        }.popupView(popupStruct: PopupStruct(type: .warning, title: "popupData.error", message: popupData.error.description, duration: 3.0) , popupState: $popupData.isPresented, popupMenager: popupMenager)
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            MainAnimeView()
                .environmentObject(PopupMenager())
        }
    }


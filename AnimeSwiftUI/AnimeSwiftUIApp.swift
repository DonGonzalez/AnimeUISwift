//
//  AnimeSwiftUIApp.swift
//  AnimeSwiftUI
//
//  Created by Robert B on 17/06/2023.
//

import SwiftUI

@main
struct AnimeSwiftUIApp: App {
    
    @StateObject var popupMenager = PopupMenager()
    
    var body: some Scene {
        WindowGroup {
            MainAnimeView()
               .environmentObject(popupMenager)
        }
    }
}

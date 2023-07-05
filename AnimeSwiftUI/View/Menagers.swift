//
//  Menagers.swift
//  AnimeSwiftUI
//
//  Created by Robert B on 05/07/2023.
//

import Foundation
import SwiftUI

struct Menagers: ViewModifier {
    var navigationTitle:String
    private static let navigationManager = NavigationManager()

    
    func body(content: Content) -> some View {
        content
            .navigationTitle(navigationTitle)
            .listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.pink,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .environmentObject(Self.navigationManager)
        
    }
}

//
//  BaseURL.swift
//  AnimeSwiftUI
//
//  Created by Robert B on 22/06/2023.
//

import Foundation

extension URL {
    
    static func makeURLWithEndpoint(endpoint: String) -> URL {
        URL(string:"https://kitsu.io/api/edge\(endpoint)")!
    }
}

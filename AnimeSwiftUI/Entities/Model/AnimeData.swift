//
//  AnimeData.swift
//  AnimeSwiftUI
//
//  Created by Robert B on 22/06/2023.
//

import Foundation
struct AnimeData: Decodable {
  
    let id: String
    let type: String
    let attributes: AttributesData
}

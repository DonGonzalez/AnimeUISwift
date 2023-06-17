//
//  MessageErrorType.swift
//  AnimeSwiftUI
//
//  Created by Robert B on 22/06/2023.
//

import Foundation
import SwiftUI

enum MessageErrorType {
    case success (String)
    case failure (String)
    
    var backgroundColor: UIColor {
        switch self {
        case .success:     return .systemGreen
        case .failure:     return .systemRed
        }
    }
    var message: String {
        switch self {
        case .success(let message):
            return message
        case .failure(let message):
            return message
        }
    }
}

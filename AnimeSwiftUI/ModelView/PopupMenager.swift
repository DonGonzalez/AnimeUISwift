//
//  PopupMenager.swift
//  AnimeSwiftUI
//
//  Created by Robert B on 10/07/2023.
//

import Foundation
import SwiftUI

class PopupMenager: ObservableObject {
    
    enum Action {
        case na
        case present
        case dissmis
        
      
        enum PopupStyle {
            case error
            case warning
            case success
            case info
            
            var themeColor: Color {
                switch self {
                case .error: return Color.red
                case .warning: return Color.orange
                case .info: return Color.blue
                case .success: return Color.green
                }
            }
            
            var iconFileName: String {
                switch self {
                case .info: return "info.circle.fill"
                case .warning: return "exclamationmark.triangle.fill"
                case .success: return "checkmark.circle.fill"
                case .error: return "xmark.circle.fill"
                }
            }
        }
    }
    
    //co to dokladnie znaczy?
    @Published private(set)var action: Action = .na

    func present() {
               // do sprwdzenia jak dziala
               self.action = .present
           }
    
    func dissmis(){
        self.action = .dissmis
    }
}


struct PopupStruct: Equatable {
    var type: PopupMenager.Action.PopupStyle
    var title: String
    var message: String
    var duration: Double = 3
}




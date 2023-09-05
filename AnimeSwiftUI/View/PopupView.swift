//
//  Popup.swift
//  AnimeSwiftUI
//
//  Created by Robert B on 10/07/2023.
//

import Foundation
import SwiftUI



 struct PopupView : View{
        
     
     var type: PopupMenager.Action.PopupStyle
     var title: String
     var message: String
     var duration: Double = 3
     var didClose: () -> Void
     
         var body: some View {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image(systemName: type.iconFileName)
                        .foregroundColor(Color.red)
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text(message)
                            .font(.system(size: 12))
                            .foregroundColor(Color.black.opacity(0.6))
                    }
                    
                    Spacer(minLength: 10)
                    Button {
                        didClose()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(Color.black)
                    }
                }
                .padding()
            }
            .background(Color.white)
            .overlay(
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 6)
                    .clipped()
                , alignment: .leading
            )
            .frame(minWidth: 0, maxWidth: .infinity)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 1)
            .padding(.horizontal, 16)
            .padding(.bottom,0)
            .ignoresSafeArea()
            .transition(.offset(y:120))
         }
    }





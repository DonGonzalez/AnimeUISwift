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

struct PopupModifier: ViewModifier {
    @ObservedObject var popupMenager: PopupMenager
      var popupStruct: PopupStruct
    @Binding var popupState: Bool
    @State private var workItem: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom ) {
                if popupState == true {
                    
                    withAnimation(.spring()) {
                        PopupView(type: popupStruct.type, title: popupStruct.title, message:  popupStruct.message ) {
                           popupState = false
                            popupMenager.dissmis()
                            
                        }
                      }
            }
            
        }
            .onChange(of: popupState) { newValue in
              
            if popupStruct.duration > 0 {
                
                popupMenager.dissmis()
                let task = DispatchWorkItem {
                        popupMenager.dissmis()
                    popupState = false
                    }
                DispatchQueue.main.asyncAfter(deadline: .now() + popupStruct.duration, execute: task)
          //    workItem = nil
          //
          //    let task = DispatchWorkItem {
          //        popupMenager.dissmis()
          //    }
          //    workItem = task
          //      DispatchQueue.main.asyncAfter(deadline: .now() + popupStruct.duration, execute: task)
            }
        }
  }
    }

extension View {
    func popupView(popupStruct: PopupStruct, popupState:Binding<Bool>, popupMenager: PopupMenager) -> some View {
        self.modifier(PopupModifier(popupMenager: popupMenager, popupStruct: popupStruct, popupState: popupState))
    }
}













/*
struct ToastModifier: ViewModifier {
    
    @Binding var toast: Toast?
    @State private var workItem: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom, content: {
                ZStack {
                    mainToastView()
                    
                }.animation(.spring(), value: toast)
                
                    .onChange(of: toast) { value in
                        showToast()
                    }
            })
    }
}
*/
    /*
    @ViewBuilder func mainToastView() -> some View {
        if let toast = toast {
            VStack {
                PopupView(type: .warning, title: ",,", message: "fff", didClose: {
                    
                })
            }
        }
    }
    */

    /*
    private func showToast() {
      guard let toast = toast else { return }
      
      UIImpactFeedbackGenerator(style: .light)
        .impactOccurred()
      
      if toast.duration > 0 {
        workItem?.cancel()
        
        let task = DispatchWorkItem {
          dismissToast()
        }
        workItem = task
        DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
      }
    }
    
    private func dismissToast() {
      withAnimation {
        toast = nil
      }
      workItem?.cancel()
      workItem = nil
    }
  }


    extension View {
    func toastView(toast: Binding<Toast?>) -> some View {
    self.modifier(ToastModifier(toast: toast))
    }
}
*/

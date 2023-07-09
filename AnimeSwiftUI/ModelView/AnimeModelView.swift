//
//  AnimeModelView.swift
//  AnimeSwiftUI
//
//  Created by Robert B on 17/06/2023.
//

import Foundation
import SwiftUI

     class ViewModel: ObservableObject {
        
       // let testUrl: URL? = URL(string: "https://kitsu.io/api/edge/anime")
        
        @Published var animeData = [AnimeData]()
         @Published var messageError: MessageErrorType?
         
         init() {
             getDataFromAnime()
         }
        func getDataFromAnime(){
            Service.shared.reqestAnimeData(url: Endpoint.moreAnime(offset: 0, sort: "", filter: "", search: "").url) {[weak self] result in
               
                    switch result {
                    case .failure(let error):
                        self?.messageError = MessageErrorType.failure(error.description)
                        return print(MessageErrorType.failure(error.description))
                    case .success(let result):
                        DispatchQueue.main.async {
                            self?.animeData = result.data
                            self?.messageError = MessageErrorType.success("Status 200")
                        }
                    }
            }
    }
}

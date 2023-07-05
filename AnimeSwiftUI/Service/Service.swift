//
//  Service.swift
//  AnimeSwiftUI
//
//  Created by Robert B on 17/06/2023.
//

import Foundation
import SwiftUI


class Service {
  
    static let shared = Service()
    
    func reqestAnimeData(url: URL? , completion: @ escaping ((Result<Anime, HttpStatusCode>) -> Void)){
        Service.shared.request(endpoint: url, completion: completion)
        }
    
    
    private func request <T: Decodable> (endpoint: URL?, completion: @ escaping (Result<T, HttpStatusCode>) -> Void){
        
        guard let url = endpoint else {
            completion(.failure(HttpStatusCode.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error as? URLError {
                completion(Result.failure(HttpStatusCode.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(HttpStatusCode.badResponse(statusCode:response.statusCode)))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                 //   completion(.failure(HttpStatusCode.unknown))
                }
                catch {
                    completion(.failure(HttpStatusCode.parsing(error as? DecodingError)))
                }
            }
        }
            task.resume()
        
}
}

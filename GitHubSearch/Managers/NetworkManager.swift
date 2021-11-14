//
//  NetworkManager.swift
//  GitHubSearch
//
//  GitHubSearch
//
//  Created by zgagaSur on 07/10/2021.
//


import UIKit

class NetworkManager {
    static let shared   = NetworkManager()
 
    
    private init() {}
    
    

    func fetchFoundRepo(longUrl: String, completion: @escaping (Result<FoundRepo, Error>) -> Void) {
         
            let wholeUrl: String = longUrl
            
       
        let req = URLRequest(url: URL(string: wholeUrl)!)
        let task = URLSession.shared.dataTask(with: req) { data, response, error in
            guard error == nil else  {
                return completion(.failure(error!))
            }
            guard let response = response as? HTTPURLResponse else {
                return completion(.failure(HTTP.Error.invalidResponse))
            }
            guard 200...299 ~= response.statusCode else {
                return completion(.failure(HTTP.Error.badStatusCode))
            }
            guard let data = data else {
                return completion(.failure(HTTP.Error.missingData))
            }
            do {
                let decoder = JSONDecoder()
                let foundRepo = try decoder.decode(FoundRepo.self, from: data)
                return completion(.success(foundRepo))
                
            }
            catch {
                return completion(.failure(error))
            }
        }
        task.resume()
    }
}

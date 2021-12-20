//
//  NetworkManager.swift
//  StoneChallenge
//
//  Created by Raileny Santana Lima on 20/12/21.
//

import UIKit

// MARK: Protocol

protocol NetworkManagerProtocol {
    func requestCharacters(completion: @escaping (Result<HomeModel, NetworkError>) -> Void)
}

// MARK: - Enum

enum NetworkError: Error {
    case undefined
    case failRequest(_ error: Error?)
    case failDecode
}

// MARK: Class

class NetworkManager: NetworkManagerProtocol {
    
    private let urlString = "https://rickandmortyapi.com/api/character"
    
    func requestCharacters(completion: @escaping (Result<HomeModel, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.undefined))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, respose, error in
            if error != nil {
                completion(.failure(.failRequest(error)))
            } else if let data = data {
                do {
                    let characters = try JSONDecoder().decode(HomeModel.self, from: data)
                    completion(.success(characters))
                } catch {
                    completion(.failure(.failDecode))
                }
            } else {
                completion(.failure(.undefined))
            }
        }.resume()
    }
}

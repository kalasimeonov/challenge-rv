//
//  NetworkingManager.swift
//  RVFinder
//
//  Created by Evelina Zaneva on 23.09.23.
//

import Foundation

final class NetworkingManager {
    
    private let decoder = JSONDecoder()
    private let urlSession = URLSession.shared
    
    func fetchData<Model: Decodable>(from url: URL) async throws -> Model? {
        do {
            let request = try await urlSession.data(from: url)
            let data = request.0
            let decodedData = try decoder.decode(Model.self, from: data)
            return decodedData
        } catch(let error) {
            print(error)
        }
        return nil
    }
}

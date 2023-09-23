//
//  RVSearchScreenViewModel.swift
//  RVFinder
//
//  Created by Evelina Zaneva on 23.09.23.
//

import Foundation

final class RVSearchScreenViewModel: ObservableObject {
    
    @Published var searchQuery: String = ""
    @Published private(set) var recVehicles: RVListings?
    
    private let networkingManager = NetworkingManager()
    
    func fetchRecVehicles(_ query: String) async {
        let urlString = "https://search.outdoorsy.com/rentals?address=atlanta&filter[keywords]=\(query)&page[limit]=8&page[offset]=8"
        let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        guard let url = URL(string: encodedUrlString) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            Task {
                self?.recVehicles = try? await self?.networkingManager.fetchData(from: url)
            }
        }
    }
}

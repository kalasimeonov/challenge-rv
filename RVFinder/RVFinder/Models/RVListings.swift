//
//  RVListings.swift
//  RVFinder
//
//  Created by Evelina Zaneva on 23.09.23.
//

import Foundation

// MARK: - RVListings
struct RVListings: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id: String
    let type: String
    let attributes: DatumAttributes
}

// MARK: - DatumAttributes
struct DatumAttributes: Codable {
    let name: String
    let primaryImageURL: String
    let location: Location
    
    enum CodingKeys: String, CodingKey {
        case name
        case primaryImageURL = "primary_image_url"
        case location
    }
}

//MARK: - Location
struct Location: Codable {
    let lat: Double
    let lng: Double
    
    enum CodingKeys: String, CodingKey {
        case lat
        case lng
    }
}

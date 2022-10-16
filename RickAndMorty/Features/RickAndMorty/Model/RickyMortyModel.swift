//
//  RickyMortyModel.swift
//  RickAndMorty
//
//  Created by Talha on 16.10.2022.
//

import Foundation

// MARK: - Welcome
struct PostModel: Codable {
    let info: Info?
    let results: [Result]?
    
    enum CodingKeys: String, CodingKey {
        case info
        case results
    }
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next: String?
    
    enum CodingKeys: String, CodingKey {
        case count
        case pages
        case next
    }
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let name, status, species, type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}

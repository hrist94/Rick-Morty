//
//  RickAndMorty.swift
//  Rick&Morty
//
//  Created by Kirill Khristenko on 28.04.2022.
//

import Foundation

// MARK: - RickAndMorty
struct RickAndMorty: Codable {
    let info: Info
    let results: [Result]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
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


enum URLS: String {
    case rickandmortyapi = "https://rickandmortyapi.com/api/character"
}

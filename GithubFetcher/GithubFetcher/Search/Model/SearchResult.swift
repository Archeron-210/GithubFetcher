//
//  SearchResult.swift
//  GithubFetcher
//
//  Created by Archeron on 25/05/2022.
//

import Foundation

// MARK: - Data Mapping From External API JSON Response

struct SearchResult: Decodable {
    var items: [ItemInfo]
}

struct ItemInfo: Decodable {
    var id: Int
    var name: String
    var fullName: String
    var description: String?
    var language: String?
    var starsCount: Int

    // setting coding keys to customize property names :
    private enum CodingKeys: String, CodingKey {
        case id, name, fullName = "full_name", description, language, starsCount = "stargazers_count"
    }
}

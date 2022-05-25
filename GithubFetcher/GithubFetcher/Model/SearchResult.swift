//
//  SearchResult.swift
//  GithubFetcher
//
//  Created by Archeron on 25/05/2022.
//

import Foundation

struct SearchResult: Decodable {
    var items: [ItemInfo]
}

struct ItemInfo: Decodable {
    var id: Int
    var fullName: String
    var description: String
    var language: String
    var starsCount: Int

    private enum CodingKeys: String, CodingKey {
        case id, fullName = "full_name", description, language, starsCount = "stargazers_count"
    }
}

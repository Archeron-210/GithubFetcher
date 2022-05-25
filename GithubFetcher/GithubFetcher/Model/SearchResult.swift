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
    var full_name: String
    var description: String
    var language: String
    var stargazers_count: Int
}

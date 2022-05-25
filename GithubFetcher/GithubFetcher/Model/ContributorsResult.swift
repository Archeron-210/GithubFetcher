//
//  ContributorsResult.swift
//  GithubFetcher
//
//  Created by Archeron on 25/05/2022.
//

import Foundation

// MARK: - Data Mapping From External API JSON Response

struct ContributorsResult: Decodable {
    var contributors: [ContributorInfo]
}

struct ContributorInfo: Decodable {
    var login: String
    var avatarUrl: String

    // setting coding keys to customize property names :
    private enum CodingKeys: String, CodingKey {
        case login, avatarUrl = "avatar_url"
    }
}

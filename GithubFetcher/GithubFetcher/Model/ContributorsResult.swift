//
//  ContributorsResult.swift
//  GithubFetcher
//
//  Created by Archeron on 25/05/2022.
//

import Foundation

struct ContributorsResult: Decodable {
    var contributors: [ContributorInfo]
}

struct ContributorInfo: Decodable {
    var login: String
    var avatarUrl: String

    private enum CodingKeys: String, CodingKey {
        case login, avatarUrl = "avatar_url"
    }
}

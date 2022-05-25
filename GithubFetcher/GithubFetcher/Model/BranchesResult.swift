//
//  BranchesResult.swift
//  GithubFetcher
//
//  Created by Archeron on 25/05/2022.
//

import Foundation

// MARK: - Data Mapping From External API JSON Response

struct BranchesResult: Decodable {
    var branches: [BranchInfo]
}

struct BranchInfo: Decodable {
    var name: String
}

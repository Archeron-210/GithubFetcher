//
//  BranchesResult.swift
//  GithubFetcher
//
//  Created by Archeron on 25/05/2022.
//

import Foundation

struct BranchesResult: Decodable {
    var branches: [BranchInfo]
}

struct BranchInfo: Decodable {
    var name: String
}

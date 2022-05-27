//
//  QueryError.swift
//  GithubFetcher
//
//  Created by Archeron on 27/05/2022.
//

import Foundation

enum QueryError: Error {
    case emptySearchText
    case parsingFailed
    case callFailed
    case noData
}

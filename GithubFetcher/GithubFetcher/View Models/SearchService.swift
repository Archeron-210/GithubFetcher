//
//  SearchService.swift
//  GithubFetcher
//
//  Created by Archeron on 27/05/2022.
//

import Foundation
import Moya

final class SearchService {

    // MARK: - Property

    private let repositoryProvider = MoyaProvider<RepositoryService>()

    // MARK: - API Call
    
    func obtainRepositories(searchText: String, completion: @escaping (Result<[ItemInfo], QueryError>) -> Void) {
        repositoryProvider.request(.showRepositories(searchText: searchText)) { result in
            switch result {
            case .success(let response):
                do {
                    let data = try response.map(SearchResult.self)
                    guard !data.items.isEmpty else {
                        completion(.failure(.noData))
                        return
                    }
                    completion(.success(data.items))
                }
                catch {
                    completion(.failure(.parsingFailed))
                }
            case .failure :
                completion(.failure(.callFailed))
            }
        }
    }
}

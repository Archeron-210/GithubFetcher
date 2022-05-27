//
//  SearchService.swift
//  GithubFetcher
//
//  Created by Archeron on 27/05/2022.
//

import Foundation
import Moya

final class SearchService {
    private let repositoryProvider = MoyaProvider<RepositoryService>()

    func obtainRepositories(searchText: String, completion: @escaping (Result<[ItemInfo], Error>) -> Void) {
        repositoryProvider.request(.showRepositories(searchText: searchText)) { result in
            switch result {
            case .success(let response):
                do {
                    let data = try response.map(SearchResult.self)
                    completion(.success(data.items))
                }
                catch(let error) {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

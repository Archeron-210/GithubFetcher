//
//  RepositoryDetailService.swift
//  GithubFetcher
//
//  Created by Archeron on 28/05/2022.
//

import Foundation
import Moya

final class RepositoryDetailService {

    // MARK: - Property

    private let repositoryProvider = MoyaProvider<GithubService>()

    // MARK: - API Calls

    func obtainBranches(for repositoryName: String, completion: @escaping (Result<[BranchInfo], QueryError>) -> Void) {
        repositoryProvider.request(.showBranches(repositoryFullName: repositoryName)) { result in
            switch result {
            case .success(let response):
                do {
                    let data = try response.map([BranchInfo].self)
                    guard !data.isEmpty else {
                        completion(.failure(.noData))
                        return
                    }
                    completion(.success(data))
                }
                catch {
                    completion(.failure(.parsingFailed))
                }
            case .failure:
                completion(.failure(.callFailed))
            }
        }
    }

    func obtainContributors(for repositoryName: String, completion: @escaping (Result<[ContributorInfo], QueryError>) -> Void) {
        repositoryProvider.request(.showContributors(repositoryFullName: repositoryName)) { result in
            switch result {
            case .success(let response):
                do {
                    let data = try response.map([ContributorInfo].self)
                    guard !data.isEmpty else {
                        completion(.failure(.noData))
                        return
                    }
                    completion(.success(data))
                }
                catch {
                    completion(.failure(.parsingFailed))
                }
            case .failure:
                completion(.failure(.callFailed))
            }
        }
    }
}

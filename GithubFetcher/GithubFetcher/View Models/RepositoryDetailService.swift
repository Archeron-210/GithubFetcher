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
                    let data = try response.map(BranchesResult.self)
                    guard !data.branches.isEmpty else {
                        completion(.failure(.noData))
                        return
                    }
                    completion(.success(data.branches))
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
                    let data = try response.map(ContributorsResult.self)
                    guard !data.contributors.isEmpty else {
                        completion(.failure(.noData))
                        return
                    }
                    completion(.success(data.contributors))
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

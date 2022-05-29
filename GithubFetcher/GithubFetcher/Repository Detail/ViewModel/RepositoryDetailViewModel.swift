//
//  RepositoryDetailViewModel.swift
//  GithubFetcher
//
//  Created by Archeron on 28/05/2022.
//

import Foundation

    // MARK: - RepositoryDetailViewModel Protocol
    // Allows ViewModel and Controller communications

protocol RepositoryDetailViewModelDelegate: AnyObject {
    func didUpdateData()
    func didFailWithError(error: QueryError)
}

final class RepositoryDetailViewModel {
    
    // MARK: - Properties

    private weak var delegate: RepositoryDetailViewModelDelegate?
    private let repositoryDetailService = RepositoryDetailService()
    private(set) var contributors: [ContributorInfo] = []
    private(set) var branches: [BranchInfo] = []
    let repositoryName: String
    let repositoryShortName: String

    // MARK: - Initialization
    
    init(repositoryName: String, repositoryShortName: String, delegate: RepositoryDetailViewModelDelegate) {
        self.repositoryName = repositoryName
        self.delegate = delegate
        self.repositoryShortName = repositoryShortName
    }

    func fetchRepositoryDetail() {
        fetchBranches()
        fetchContributors()
    }

    private func fetchBranches() {
        repositoryDetailService.obtainBranches(for: repositoryName) { result in
            switch result {
            case .success(let response):
                self.branches = response
                self.delegate?.didUpdateData()
            case .failure(let error):
                self.delegate?.didFailWithError(error: error)
            }
        }
    }

    private func fetchContributors() {
        repositoryDetailService.obtainContributors(for: repositoryName) { result in
            switch result {
            case .success(let response):
                self.contributors = response
                self.delegate?.didUpdateData()
            case .failure(let error):
                self.delegate?.didFailWithError(error: error)
            }
        }
    }
}

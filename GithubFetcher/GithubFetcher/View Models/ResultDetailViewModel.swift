//
//  ResultDetailViewModel.swift
//  GithubFetcher
//
//  Created by Archeron on 28/05/2022.
//

import Foundation

protocol ResultDetailViewModelDelegate: AnyObject {
    func didUpdateData()
    func didFailWithError(error: QueryError)
}

final class ResultDetailViewModel {
    // MARK: - Properties

    weak var delegate: ResultDetailViewModelDelegate?
    private let repositoryDetailService = RepositoryDetailService()
    private(set) var contributors: [ContributorInfo] = []
    private(set) var branches: [BranchInfo] = []
    private let repositoryName: String

    // MARK: - Initialization
    
    init(repositoryName: String) {
        self.repositoryName = repositoryName
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

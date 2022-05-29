//
//  SearchViewModel.swift
//  GithubFetcher
//
//  Created by Archeron on 27/05/2022.
//

import Foundation

    // MARK: - SearchViewModel Protocol
    // Allows ViewModel and Controller communications

protocol SearchViewModelDelegate: AnyObject {
    func didUpdateRepositories()
    func didFailWithError(error: QueryError)
}

final class SearchViewModel {

    // MARK: - Properties

    weak var delegate: SearchViewModelDelegate?
    private(set) var repositories: [ItemInfo] = []
    private let searchService = SearchService()
    var searchText: String? {
        didSet {
            searchTextDidChange(searchText: searchText)
        }
    }

    // MARK: - Search Repositories

    private func searchTextDidChange(searchText: String?) {
        guard let searchText = searchText else {
            repositories = []
            delegate?.didUpdateRepositories()
            return
        }
        guard !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            delegate?.didFailWithError(error: .emptySearchText)
            return
        }
        searchService.obtainRepositories(searchText: searchText) { result in
            switch result {
            case .success(let response):
                self.repositories = response
                self.delegate?.didUpdateRepositories()
            case .failure(let error):
                self.delegate?.didFailWithError(error: error)
            }
        }
    }
}

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

class SearchViewModel {

    // MARK: - Properties

    weak var delegate: SearchViewModelDelegate?
    private(set) var repositories: [ItemInfo] = []
    private let searchService = SearchService()
    var searchText: String? {
        didSet {
            self.searchTextDidChange(searchText: searchText)
        }
    }

    // MARK: - Behavior

    func searchTextDidChange(searchText: String?) {
        guard let searchText = searchText else {
            self.repositories = []
            return
        }
        guard !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            self.delegate?.didFailWithError(error: .emptySearchText)
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

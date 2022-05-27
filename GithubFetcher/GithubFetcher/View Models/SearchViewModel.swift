//
//  SearchViewModel.swift
//  GithubFetcher
//
//  Created by Archeron on 27/05/2022.
//

import Foundation
import Moya

protocol SearchViewModelDelegate: AnyObject {
    func didUpdateRepositories()
    func didFailWithError(error: Error)
}

class SearchViewModel {
    weak var delegate: SearchViewModelDelegate?
    private(set) var repositories: [ItemInfo] = []
    private let searchService = SearchService()
    var searchText: String? {
        didSet {
            self.searchTextDidChange(searchText: searchText)
        }
    }

    func searchTextDidChange(searchText: String?) {
        guard let searchText = searchText, !searchText.isEmpty else {
            self.repositories = []
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

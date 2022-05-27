//
//  SearchViewModel.swift
//  GithubFetcher
//
//  Created by Archeron on 27/05/2022.
//

import Foundation
import Moya

class SearchViewModel {
    private(set) var repositories: [ItemInfo] = []
    private let searchService = SearchService()
    var searchText: String? {
        didSet {
            self.searchTextDidChange(searchText: searchText)
        }
    }

    func searchTextDidChange(searchText: String?) {
        guard let searchText = searchText else {
            return
        }
        searchService.obtainRepositories(searchText: searchText) { result in
            switch result {
            case .success(let response):
                self.repositories = response
            case .failure(let error):
                print("oh no \(error)")
            }
        }
    }
}

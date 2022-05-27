//
//  SearchViewController.swift
//  GithubFetcher
//
//  Created by Archeron on 25/05/2022.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Properties

    let viewModel = SearchViewModel()
    let searchController = UISearchController(searchResultsController: nil)

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Search"
        navigationItem.searchController = searchController
    }
    
}

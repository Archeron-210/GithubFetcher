//
//  SearchViewController.swift
//  GithubFetcher
//
//  Created by Archeron on 25/05/2022.
//

import UIKit

class SearchViewController: UIViewController {

    let searchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Search"
        navigationItem.searchController = searchController
    }
    
}

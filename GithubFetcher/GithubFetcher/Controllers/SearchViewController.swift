//
//  SearchViewController.swift
//  GithubFetcher
//
//  Created by Archeron on 25/05/2022.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Oultlets

    @IBOutlet weak var tableView: UITableView!


    // MARK: - Properties

    let viewModel = SearchViewModel()
    let searchController = UISearchController(searchResultsController: nil)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Search"
        navigationItem.searchController = searchController
        setTableViewAspect()
    }

    // MARK: - Private

    private func setTableViewAspect() {
        tableView.layer.cornerRadius = 15
    }
    
}

extension SearchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }


}

extension SearchViewController: UITableViewDelegate {

}

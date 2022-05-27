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
    @IBOutlet weak var searchBar: UISearchBar!


    // MARK: - Properties

    private let viewModel = SearchViewModel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Search"
        setupTableView()
        searchBar.delegate = self
        viewModel.delegate = self
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        //tapGestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    // MARK: - Private

    private func setupTableView() {
        tableView.layer.cornerRadius = 15
        tableView.reloadData()
    }

    @objc func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
}

extension SearchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension SearchViewController: UITableViewDelegate {

}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchText = searchBar.text
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchText = nil
        searchBar.resignFirstResponder()
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func didUpdateRepositories() {
        tableView.reloadData()
    }

    func didFailWithError(error: Error) {
        print("error \(error)")
    }
}

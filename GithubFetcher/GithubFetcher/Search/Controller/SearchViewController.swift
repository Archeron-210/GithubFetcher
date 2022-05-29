//
//  SearchViewController.swift
//  GithubFetcher
//
//  Created by Archeron on 25/05/2022.
//

import UIKit

class SearchViewController: UIViewController, Storyboarded {

    // MARK: - Oultlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!


    // MARK: - Properties

    weak var coordinator: SearchCoordinator?
    private let viewModel = SearchViewModel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Search"
        setupTableView()
        setSearchBarAspect()
        searchBar.delegate = self
        viewModel.delegate = self
        hideKeyboardWithTapGesture()
    }

    // MARK: - Private

    private func setupTableView() {
        tableView.layer.cornerRadius = 15
        tableView.backgroundColor = UIColor.white
        tableView.reloadData()
    }

    private func setSearchBarAspect() {
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = UIColor.black
    }

    private func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionAlert = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionAlert)
        present(alert, animated: true, completion: nil)
    }

    // MARK: - Keyboard Management

    private func hideKeyboardWithTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
}

    // MARK: - SearchBar Management

extension SearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchText = searchBar.text
        searchBar.endEditing(true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        viewModel.searchText = nil
        searchBar.endEditing(true)
    }
}


    // MARK: - SearchViewModelDelegate

extension SearchViewController: SearchViewModelDelegate {

    func didUpdateRepositories() {
        tableView.reloadData()
    }

    func didFailWithError(error: QueryError) {
        switch error {
        case .emptySearchText:
            alert(title: "Warning ⚠︎", message: "Search bar seems empty, please verify your query")
        case .noData:
            alert(title: "Error ✕", message: "Seems like this name does not exist, please check your spelling")
        case .callFailed, .parsingFailed:
            alert(title: "Error ✕", message: "Something went wrong with servers, please try again later")
        }
    }
}

    // MARK: - TableView Management - DataSource

extension SearchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath) as? RepositoryTableViewCell else {
            return UITableViewCell()
        }
        guard viewModel.repositories.count > indexPath.row else {
            return UITableViewCell()
        }
        let repository = viewModel.repositories[indexPath.row]
        cell.configure(with: repository)
        return cell
    }
}

    // MARK: - TableView Management - Delegate

extension SearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard viewModel.repositories.count > indexPath.row else {
            return
        }
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator?.showRepositoryDetail(for: viewModel.repositories[indexPath.row])
    }
}

    // MARK: - Coodinatorable Implementation

extension SearchViewController: Coordinatorable {
    var genericCoordinator: Coordinator? {
        return coordinator
    }
}

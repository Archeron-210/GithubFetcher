//
//  ResultDetailViewController.swift
//  GithubFetcher
//
//  Created by Archeron on 25/05/2022.
//

import UIKit

class ResultDetailViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties

    var viewModel: ResultDetailViewModel?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel?.repositoryShortName ?? "Details"
        viewModel?.fetchRepositoryDetail()
        setupTableView()
    }

    // MARK: - Functions


    // MARK: - Private

    private func setupTableView() {
        tableView.layer.cornerRadius = 15
        tableView.reloadData()
        tableView.backgroundColor = UIColor.white
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
    }
}


    // MARK: - ResultDetailViewModelDelegate

extension ResultDetailViewController: ResultDetailViewModelDelegate {
    func didUpdateData() {
        tableView.reloadData()
    }

    func didFailWithError(error: QueryError) {
        print("error")
    }
}

    // MARK: - TableView Management - DataSource

extension ResultDetailViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return viewModel?.branches.count ?? 0
        case 1:
            return viewModel?.contributors.count ?? 0
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return makeBranchCell(for: indexPath)
        case 1:
            return makeContributorCell(for: indexPath)
        default:
            return UITableViewCell()
        }
    }
}

    // MARK: - TableView Management - Delegate

extension ResultDetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 60.0
        case 1:
            return 120.0
        default:
            #warning("TODO: Test default case")
            return 0.0
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return makeHeader(title: "◦ Branches")
        case 1:
            return makeHeader(title: "◦ Contributors")
        default:
            return UIView()
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60.0
    }
}


// MARK: - Cells & Headers Makers

private extension ResultDetailViewController {

    func makeBranchCell(for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BranchCell", for: indexPath) as? BranchTableViewCell else {
            return UITableViewCell()
        }
        guard viewModel?.branches.count ?? 0 > indexPath.row, let branch = viewModel?.branches[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configure(with: branch)
        cell.selectionStyle = .none
        return cell
    }

    func makeContributorCell(for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContributorCell", for: indexPath) as? ContributorTableViewCell else {
            return UITableViewCell()
        }
        guard viewModel?.contributors.count ?? 0 > indexPath.row, let contributor = viewModel?.contributors[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configure(with: contributor)
        cell.selectionStyle = .none
        return cell
    }

    func makeHeader(title: String) -> UIView {


        let header = UIView()
        //header.backgroundColor = UIColor.white.withAlphaComponent(0.8)

        let blurEffect = UIBlurEffect(style: .light)
        let blurVisual = UIVisualEffectView(effect: blurEffect)
        header.addSubview(blurVisual)

        blurVisual.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blurVisual.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            blurVisual.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            blurVisual.topAnchor.constraint(equalTo: header.topAnchor),
            blurVisual.bottomAnchor.constraint(equalTo: header.bottomAnchor)
        ])

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        titleLabel.textColor = UIColor.lightBlue
        header.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: header.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: header.bottomAnchor)
        ])

        return header
    }

}


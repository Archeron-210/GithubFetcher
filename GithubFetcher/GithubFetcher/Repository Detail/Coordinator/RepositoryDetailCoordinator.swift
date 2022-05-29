//
//  RepositoryDetailCoordinator.swift
//  GithubFetcher
//
//  Created by Archeron on 29/05/2022.
//

import UIKit

class RepositoryDetailCoordinator: Coordinator {
    // MARK: - Properties

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var parentCoordinator: Coordinator?
    private var repository: ItemInfo

    // MARK: - Initialization

    init(navigationController: UINavigationController, repository: ItemInfo) {
        self.navigationController = navigationController
        self.repository = repository
    }

    // MARK: - Start

    func start() {
        let repositoryDetailViewController = RepositoryDetailViewController.instantiate()
        repositoryDetailViewController.coordinator = self
        let detailViewModel = RepositoryDetailViewModel(repositoryName: repository.fullName, repositoryShortName: repository.name, delegate: repositoryDetailViewController)
        repositoryDetailViewController.viewModel = detailViewModel
        navigationController.pushViewController(repositoryDetailViewController, animated: true)
    }
}

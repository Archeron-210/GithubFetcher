//
//  SearchCoordinator.swift
//  GithubFetcher
//
//  Created by Archeron on 29/05/2022.
//

import UIKit

protocol SearchCoordinatorProtocol: AnyObject {
    func showRepositoryDetail(for repository: ItemInfo)
}

class SearchCoordinator: Coordinator {
    // MARK: - Properties

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var parentCoordinator: Coordinator?

    // MARK: - Initialization

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Start

    func start() {
        let searchController = SearchViewController.instantiate()
        searchController.coordinator = self
        navigationController.pushViewController(searchController, animated: true)
    }
}

extension SearchCoordinator: SearchCoordinatorProtocol {
    func showRepositoryDetail(for repository: ItemInfo) {
        let coordinator = RepositoryDetailCoordinator(navigationController: navigationController, repository: repository)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

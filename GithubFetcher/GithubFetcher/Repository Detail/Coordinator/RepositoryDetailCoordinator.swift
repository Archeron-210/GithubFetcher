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

    // MARK: - Initialization

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Start

    func start() {

    }
}

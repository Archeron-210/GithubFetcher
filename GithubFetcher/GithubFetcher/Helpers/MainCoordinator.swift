//
//  MainCoordinator.swift
//  GithubFetcher
//
//  Created by Archeron on 29/05/2022.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    weak var parentCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.delegate = self
        let searchCoordinator = SearchCoordinator(navigationController: navigationController)
        searchCoordinator.parentCoordinator = self
        childCoordinators.append(searchCoordinator)
        searchCoordinator.start()
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a repository detail controller
        if let repositoryController = fromViewController as? Coordinatorable {
            repositoryController.genericCoordinator?.finish()
        }
    }
}

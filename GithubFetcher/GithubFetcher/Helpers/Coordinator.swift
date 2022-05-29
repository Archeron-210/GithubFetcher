//
//  Coordinator.swift
//  GithubFetcher
//
//  Created by Archeron on 29/05/2022.
//

import UIKit

protocol Coordinator: AnyObject {
    // Used by all coordinators
    var navigationController: UINavigationController { get set }
    func start()

    // Used by parent coordinators
    var childCoordinators: [Coordinator] { get set }
    func finish(child: Coordinator)

    // Used by child coordinators
    var parentCoordinator: Coordinator? { get set }
    func finish()
}

extension Coordinator {
    func finish(child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }

    func finish() {
        self.parentCoordinator?.finish(child: self)
    }
}

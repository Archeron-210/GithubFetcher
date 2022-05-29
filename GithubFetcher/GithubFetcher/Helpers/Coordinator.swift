//
//  Coordinator.swift
//  GithubFetcher
//
//  Created by Archeron on 29/05/2022.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

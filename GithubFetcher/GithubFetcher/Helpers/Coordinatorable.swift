//
//  Coordinatorable.swift
//  GithubFetcher
//
//  Created by Archeron on 29/05/2022.
//

import Foundation

protocol Coordinatorable: AnyObject {
    var genericCoordinator: Coordinator? { get }
}

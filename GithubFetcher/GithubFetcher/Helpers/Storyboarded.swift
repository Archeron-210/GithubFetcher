//
//  Storyboarded.swift
//  GithubFetcher
//
//  Created by Archeron on 29/05/2022.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let instance = storyboard.instantiateViewController(withIdentifier: id) as! Self
        return instance
    }
}

//
//  RepositoryTableViewCell.swift
//  GithubFetcher
//
//  Created by Archeron on 27/05/2022.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageAndStargazersLabel: UILabel!

    func configure(with repository: ItemInfo) {
        nameLabel.text = repository.fullName
        descriptionLabel.text = repository.description ?? "No description available"
        let language = repository.language ?? "Not specified"
        languageAndStargazersLabel.text = "\(language) - ✩ \(repository.starsCount) "
    }
}

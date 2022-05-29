//
//  BranchTableViewCell.swift
//  GithubFetcher
//
//  Created by Archeron on 28/05/2022.
//

import UIKit

final class BranchTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var branchNameLabel: UILabel!

    // MARK: - Configure

    func configure(with branch: BranchInfo) {
        branchNameLabel.text = branch.name
    }
}

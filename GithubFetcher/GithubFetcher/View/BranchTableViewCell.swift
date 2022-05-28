//
//  BranchTableViewCell.swift
//  GithubFetcher
//
//  Created by Archeron on 28/05/2022.
//

import UIKit

class BranchTableViewCell: UITableViewCell {


    @IBOutlet weak var branchNameLabel: UILabel!


    func configure(with branch: BranchInfo) {
        branchNameLabel.text = branch.name
    }
}

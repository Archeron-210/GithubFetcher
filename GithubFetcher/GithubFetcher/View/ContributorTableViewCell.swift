//
//  ContributorTableViewCell.swift
//  GithubFetcher
//
//  Created by Archeron on 27/05/2022.
//

import UIKit

class ContributorTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userProfileImageView: UIImageView!

    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setProfilePictAspect()
    }

    // MARK: - Configure


    // MARK: - Private

    private func setProfilePictAspect() {
        userProfileImageView.layer.cornerRadius = 64
    }

}

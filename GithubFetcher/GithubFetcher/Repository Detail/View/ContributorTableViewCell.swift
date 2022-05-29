//
//  ContributorTableViewCell.swift
//  GithubFetcher
//
//  Created by Archeron on 27/05/2022.
//

import UIKit
import Kingfisher

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

    func configure(with contributor: ContributorInfo) {
        userNameLabel.text = contributor.login
        let avatarURL = URL(string: contributor.avatarUrl)
        userProfileImageView.kf.setImage(with: avatarURL, placeholder: UIImage(named: "placeholderPict"))
    }

    // MARK: - Private

    private func setProfilePictAspect() {
        userProfileImageView.layer.cornerRadius = userProfileImageView.frame.height/2
    }

}

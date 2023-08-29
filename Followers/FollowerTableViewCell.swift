//
//  ProfileTableViewCell.swift
//  Profiles
//
//  Created by Reuben Simphiwe Kuse on 2023/06/30.
//

import Foundation
import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var userNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userNameLabel, nameLabel])
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var imageViewStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageView, userNameStackView])
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: UIControl.State.normal)
        button.setTitleColor(.white, for: UIControl.State.normal)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 12.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        accessoryType = .none
        setupUI()
    }
    
    func setupUI() {
        addSubview(profileImageView)
        addSubview(followButton)
        addSubview(imageViewStackView)
        
        profileImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        followButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        followButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        followButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        followButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        imageViewStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        imageViewStackView.rightAnchor.constraint(equalTo: followButton.rightAnchor, constant: -10).isActive = true
        imageViewStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//
//  FollowerTableViewCell.swift
//  Followers
//
//  Created by Reuben Simphiwe Kuse on 2023/06/30.
//

import Foundation
import UIKit

class FollowerTableViewCell: UITableViewCell {
    
    lazy var followerImageView: UIImageView = {
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
        label.text = "Ndalo_K"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ndalwentle Kuse"
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
    
    lazy var imageViewStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followerImageView, userNameStackView])
        stackView.alignment = .trailing
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: UIControl.State.normal)
        button.setTitleColor(.white, for: UIControl.State.normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        accessoryType = .none
        setupUI()
    }
    
    func setupUI() {
        addSubview(followerImageView)
        addSubview(followButton)
        addSubview(imageViewStack)
        addSubview(userNameStackView)
        
        //followerImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        followerImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        followerImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        //followerImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        followButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        followButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        followButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        followButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        imageViewStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        imageViewStack.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageViewStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        userNameStackView.leftAnchor.constraint(equalTo: followerImageView.rightAnchor, constant: 10).isActive = true
        userNameStackView.rightAnchor.constraint(equalTo: followButton.rightAnchor, constant: -10).isActive = true
        userNameStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

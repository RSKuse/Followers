//
//  FollowerProfileViewController.swift
//  Followers
//
//  Created by Reuben Simphiwe Kuse on 2023/07/07.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController  {
    
    var follower: Follower?
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 70
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.borderWidth = 4.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var profileNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var occupationNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var linkNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var linkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var postNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var followNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var followingNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var postCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var followerCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var followingCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var postCountLabelStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postCountLabel, postNameLabel])
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var followCountLabelStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followerCountLabel, followNameLabel])
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var followingCountLabelStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followingCountLabel, followingNameLabel])
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var postFollowerFollowingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postCountLabelStack, followCountLabelStack, followingCountLabelStack])
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var profileOccupationDescriptionStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileNameLabel, occupationNameLabel, descriptionNameLabel ])
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var linkImageViewStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [linkImageView, linkNameLabel])
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 4
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
    
    lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Message", for: UIControl.State.normal)
        button.setTitleColor(.white, for: UIControl.State.normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 12.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var addFriendButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "plus_user_icon")!
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 12.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var threeDotsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dots_three_fill_icon"), for: .normal)
        button.addTarget(self, action: #selector(threeDotsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        navigationItem.title = follower?.followerUserName
        profileImageView.image = follower?.followerImage
        profileNameLabel.text = follower?.followerName
        postNameLabel.text = follower?.postLabel
        followNameLabel.text = follower?.followerLabel
        followingNameLabel.text = follower?.followingLabel
        postCountLabel.text = follower?.postCount
        followerCountLabel.text = follower?.followerCount
        followingCountLabel.text = follower?.followingCount
        occupationNameLabel.text = follower?.professionUserLabel
        descriptionNameLabel.text = follower?.sloganUserLabel
        linkImageView.image = follower?.linkImage
        linkNameLabel.text = follower?.linkUserLabel
        let threeDotsBarButtonItem = UIBarButtonItem(customView: threeDotsButton)
        navigationItem.rightBarButtonItem = threeDotsBarButtonItem
    }
    
    func setupUI() {
        view.addSubview(profileImageView)
        view.addSubview(postFollowerFollowingStackView)
        view.addSubview(profileOccupationDescriptionStackView)
        view.addSubview(linkImageView)
        view.addSubview(linkImageViewStackView)
        view.addSubview(followButton)
        view.addSubview(messageButton)
        view.addSubview(addFriendButton)
        view.addSubview(threeDotsButton)
        

        profileImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        
        postFollowerFollowingStackView.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 30).isActive = true
        postFollowerFollowingStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        postFollowerFollowingStackView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        
        profileOccupationDescriptionStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        profileOccupationDescriptionStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10).isActive = true
        profileOccupationDescriptionStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
       
        linkNameLabel.leftAnchor.constraint(equalTo: linkImageView.rightAnchor, constant: 8).isActive = true
        linkNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
        linkImageViewStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        linkImageViewStackView.topAnchor.constraint(equalTo: profileOccupationDescriptionStackView.bottomAnchor, constant: 15).isActive = true
        linkImageViewStackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        linkImageViewStackView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        followButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        followButton.topAnchor.constraint(equalTo: linkImageViewStackView.bottomAnchor, constant: 15).isActive = true
        followButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        followButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        messageButton.leftAnchor.constraint(equalTo: followButton.rightAnchor, constant: 8).isActive = true
        messageButton.topAnchor.constraint(equalTo: linkImageViewStackView.bottomAnchor, constant: 15).isActive = true
        messageButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        messageButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addFriendButton.leftAnchor.constraint(equalTo: messageButton.rightAnchor, constant: 8).isActive = true
        addFriendButton.topAnchor.constraint(equalTo: linkImageViewStackView.bottomAnchor, constant: 15).isActive = true
        addFriendButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        addFriendButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        threeDotsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        threeDotsButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20).isActive = true
        threeDotsButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        threeDotsButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

    }
    
    @objc func threeDotsButtonTapped() {
        
        let alertController = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: UIAlertController.Style.actionSheet)
        
        let restrictButton = UIAlertAction(title: "Restrict",
                                        style: .destructive, handler: { (_) -> Void in
        })
        
        let blockButton = UIAlertAction(title: "Block",
                                        style: .destructive, handler: { (_) -> Void in
        })
        
        let reportButton = UIAlertAction(title: "Report",
                                        style: .destructive, handler: { (_) -> Void in
        })
        
        let aboutThisAccoutButton = UIAlertAction(title: "About This Account",
                                        style: .destructive, handler: { (_) -> Void in
        })
        
        let hideYourStoryButton = UIAlertAction(title: "Hide your story",
                                                style: .default, handler: { (_) -> Void in
        })
        
        let copyProfileURLButton = UIAlertAction(title: "Copy Profile URL",
                                                 style: .default, handler: { (_) -> Void in
        })
    
        let shareThisProfileButton = UIAlertAction(title: "Share This Profile",
                                                   style: .default, handler: { (_) -> Void in
        })
        
        let qrCodeButton = UIAlertAction(title: "QR code",
                                         style: .default, handler: { (_) -> Void in
        })
      
        let cancelButton = UIAlertAction(title: "Cancel",
                                                     style: .cancel,
                                                     handler: { (_) -> Void in
        })

        alertController.addAction(restrictButton)
        alertController.addAction(blockButton)
        alertController.addAction(reportButton)
        alertController.addAction(aboutThisAccoutButton)
        alertController.addAction(hideYourStoryButton)
        alertController.addAction(copyProfileURLButton)
        alertController.addAction(shareThisProfileButton)
        alertController.addAction(qrCodeButton)
        alertController.addAction(cancelButton)

        present(alertController, animated: true, completion: nil)
        
    }
    
}

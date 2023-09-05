//
//  ProfileProfileViewController.swift
//  Profiles
//
//  Created by Reuben Simphiwe Kuse on 2023/07/07.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController  {
    
    var profile: Profile?
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var profileStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: Posts Count
    lazy var postCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var postsLabel: UILabel = {
        let label = UILabel()
        label.text = "Posts"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var postsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postCountLabel, postsLabel])
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: Follower Count
    lazy var followerCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.text = "Followers"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var followersStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followerCountLabel, followersLabel])
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: Following Count
    lazy var followingCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.text = "Followers"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var followingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followingCountLabel, followingLabel])
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 2
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var profileStatsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postsStackView, followersStackView, followingStackView])
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow back", for: UIControl.State.normal)
        button.setTitleColor(.white, for: UIControl.State.normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var messageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGroupedBackground
        button.setTitle("Message", for: UIControl.State.normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var addFriendButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plus_user_icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 6.0, left: 6.0, bottom: 6.0, right: 6.0)
        button.backgroundColor = .systemGroupedBackground
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followButton, messageButton])
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        navigationItem.title = profile?.username
        profileImageView.image = profile?.profileImage
        nameLabel.text = profile?.name
        postCountLabel.text = "\(profile!.postCount)"
        followerCountLabel.text = "\(profile!.followerCount)"
        followingCountLabel.text = "\(profile!.followingCount)"
        descriptionLabel.text = profile?.slogan
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "•••",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(threeDotsButtonTapped))
        followButton.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
    }
    
    func setupUI() {
        view.addSubview(profileImageView)
        view.addSubview(profileStatsStackView)
        view.addSubview(profileStackView)
        view.addSubview(addFriendButton)
        view.addSubview(buttonStackView)
        
        profileImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        
        profileStatsStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        profileStatsStackView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        
        profileStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        profileStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10).isActive = true
        profileStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
        addFriendButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        addFriendButton.topAnchor.constraint(equalTo: profileStackView.bottomAnchor,
                                            constant: 20).isActive = true
        addFriendButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        addFriendButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        buttonStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        buttonStackView.rightAnchor.constraint(equalTo: addFriendButton.leftAnchor, constant: -6).isActive = true
        buttonStackView.centerYAnchor.constraint(equalTo: addFriendButton.centerYAnchor).isActive = true
        buttonStackView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        followButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        messageButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
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
    @objc func followButtonTapped() {
        let alertController = UIAlertController(title: "Confirm",
                                                message: profile!.isFollowing ? "Confirm you want to follow \(profile!.username)?" : "Confirm you want to unfollow \(profile!.name)?",
                                                preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { _ in
            self.profile?.isFollowing.toggle()
            
            let title = (self.profile!.isFollowing) ? "Follow back" : "Following"
            self.followButton.setTitle(title, for: .normal)
            
            let titleColor = (self.profile!.isFollowing) ? UIColor.white : UIColor.black
            let backgroundColor = (self.profile!.isFollowing) ? UIColor.systemBlue : UIColor.systemGroupedBackground
            self.followButton.setTitleColor(titleColor, for: .normal)
            sel.followButton.backgroundColor = backgroundColor
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }

    
}

//let followButtonTitle = profile.isFollowing ? "Follow back" : "Following"
//followerCell.followButton.setTitle(followButtonTitle, for: .normal)
//
//// Update the Title and background if the profile is being followed or not.
//let titleColour = profile.isFollowing ? UIColor.white : UIColor.black
//followerCell.followButton.setTitleColor(titleColour, for: .normal)
//
//let backgroundColour = profile.isFollowing ? UIColor.systemBlue : UIColor.systemGroupedBackground
//followerCell.followButton.backgroundColor = backgroundColour
//
//// MARK: Other way to do it. Still using closures.
//followerCell.followButtonTapped = {
//
//    let alert = UIAlertController(title: "Follow Confirmation \(profile.name)",
//                                  message: "Do you want to follow \(profile.username)?",
//                                  preferredStyle: .actionSheet)
//    let followAction = UIAlertAction(title: "Follow ", style: .default) { _ in
//
//        profile.isFollowing.toggle()
//        let followButtonTitle = profile.isFollowing ? "Follow back" : "Following"
//        followerCell.followButton.setTitle(followButtonTitle, for: .normal)
//
//        let titleColour = profile.isFollowing ? UIColor.white : UIColor.black
//        followerCell.followButton.setTitleColor(titleColour, for: .normal)
//
//        let backgroundColour = profile.isFollowing ? UIColor.systemBlue  : UIColor.systemGroupedBackground
//        followerCell.followButton.backgroundColor = backgroundColour
//
//    }
//
//    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
//
//    alert.addAction(followAction)
//    alert.addAction(cancelAction)
//    self.present(alert, animated: true, completion: nil)
//}
//
//return followerCell
//}

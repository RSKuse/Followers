//
//  ViewController.swift
//  Profiles
//
//  Created by Reuben Simphiwe Kuse on 2023/06/30.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
   let database = UserDatabase()
   
   lazy var followerTableView: UITableView = {
       let tableView = UITableView(frame: .zero, style: .plain)
       tableView.delegate = self
       tableView.dataSource = self
       tableView.allowsSelection = true
       tableView.translatesAutoresizingMaskIntoConstraints = false
       return tableView
   }()
   
   override func viewDidLoad() {
       super.viewDidLoad()
       title = "Profiles"
       setupUI()
       handleRegisterCell()
   }
   
   func setupUI() {
       view.addSubview(followerTableView)
       
       followerTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
       followerTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
       followerTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
       followerTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
   }
   
   func handleRegisterCell() {
       followerTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileTableViewCellID")
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return database.profileArray.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let followerCell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCellID",for: indexPath) as! ProfileTableViewCell
       var profile = database.profileArray[indexPath.row]
       followerCell.userNameLabel.text = profile.username
       followerCell.profileImageView.image = profile.profileImage
       followerCell.followButtonTapped = { [] in
           self.showFollowAlert(for: profile) {
               profile.isFollowing.toggle()
               let followButtonTitle = profile.isFollowing ? "Follow" : "Following"
               followerCell.followButton.setTitle(followButtonTitle, for: .normal)
               self.database.profileArray[indexPath.row].isFollowing = profile.isFollowing
           }
       }
       let followButtonTitle = profile.isFollowing ? "Follow" : "Following"
       followerCell.followButton.setTitle(followButtonTitle, for: .normal)
       return followerCell
   }
   
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 72
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       tableView.deselectRow(at: indexPath, animated: true)
       let profileViewController = ProfileViewController()
       profileViewController.profile = database.profileArray[indexPath.row]
       navigationController?.pushViewController(profileViewController, animated: true)
   }
   
   func showFollowAlert(for profile: Profile, completion: @escaping () -> Void) {
       let alert = UIAlertController(title: "Follow Confirmation \(profile.name)",
                                     message: "Do you want to follow \(profile.username)?",
                                     preferredStyle: .actionSheet)
       let followAction = UIAlertAction(title: "Follow", style: .default) { _ in
           completion()
       }
       let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
       alert.addAction(followAction)
       alert.addAction(cancelAction)
       present(alert, animated: true, completion: nil)
   }

}

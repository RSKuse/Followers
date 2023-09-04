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
       
       let followButtonTitle = profile.isFollowing ? "Following" : "Follow"
       followerCell.followButton.setTitle(followButtonTitle, for: .normal)
       
       // Update the Title and background if the profile is being followed or not.
       let titleColour = profile.isFollowing ? UIColor.black : UIColor.white
       followerCell.followButton.setTitleColor(titleColour, for: .normal)
       
       let backgroundColour = profile.isFollowing ? UIColor.systemGroupedBackground : UIColor.systemBlue
       followerCell.followButton.backgroundColor = backgroundColour
       
       // MARK: Simphiwe's solution
       /*
       followerCell.followButtonTapped = { [] in
           self.showFollowAlert(for: profile) {
               profile.isFollowing.toggle()
               let followButtonTitle = profile.isFollowing ? "Follow" : "Following"
               followerCell.followButton.setTitle(followButtonTitle, for: .normal)
               self.database.profileArray[indexPath.row].isFollowing = profile.isFollowing
               
               followerCell.followButton.setTitleColor(.black, for: .normal)
               followerCell.followButton.backgroundColor = .systemGroupedBackground
           }
       }
       */
       
       // MARK: Other way to do it. Still using closures.
       followerCell.followButtonTapped = {
           
           let alert = UIAlertController(title: "Follow Confirmation \(profile.name)",
                                         message: "Do you want to follow \(profile.username)?",
                                         preferredStyle: .actionSheet)
           let followAction = UIAlertAction(title: "Follow Back", style: .default) { _ in
               
               profile.isFollowing.toggle()
               let followButtonTitle = profile.isFollowing ? "Following" : "Follow"
               followerCell.followButton.setTitle(followButtonTitle, for: .normal)
               
               let titleColour = profile.isFollowing ? UIColor.black : UIColor.white
               followerCell.followButton.setTitleColor(titleColour, for: .normal)
               
               let backgroundColour = profile.isFollowing ? UIColor.systemGroupedBackground : UIColor.systemBlue
               followerCell.followButton.backgroundColor = backgroundColour
           }
           
           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
           
           alert.addAction(followAction)
           alert.addAction(cancelAction)
           self.present(alert, animated: true, completion: nil)
       }
       
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
   
    /*
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
    */

}

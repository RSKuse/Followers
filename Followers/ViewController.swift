//
//  ViewController.swift
//  Followers
//
//  Created by Reuben Simphiwe Kuse on 2023/06/30.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var followersArray: [Follower] = [Follower(followerImage: UIImage(named: "Vegeta")!, linkImage: UIImage(named: "link.png")!, followerName: "Vegeta", followerUserName: "Prince_of_Saiyans", professionUserLabel: "Prince🤴🏾", sloganUserLabel: "KAKAROT IS MY RIVAL.💪🏾👊🏾💪🏾", linkUserLabel: "www.princeofsaiyans.com", postLabel: "Posts", followerLabel: "Followers", followingLabel: "Following", postCount: "1 116", followerCount: "221 M", followingCount: "20"),
                                      Follower(followerImage: UIImage(named: "Goku")!, linkImage: UIImage(named: "link.png")!, followerName: "Son Goku", followerUserName: "Goku_aka_Kakarot", professionUserLabel: "Champion Of The Universe Tournament of Power🥴", sloganUserLabel: "Kamehameha! I Know Vegeta Dont want no smoke with me😎", linkUserLabel: "www.supersaiyanultrainstinct.com", postLabel: "Posts", followerLabel: "Followers", followingLabel: "Following", postCount: "0", followerCount: "7.888 B", followingCount: "1"), Follower(followerImage: UIImage(named: "Piccolo")!, linkImage: UIImage(named: "link.png")!, followerName: "Piccolo", followerUserName: "Piccolo_The Namekian", professionUserLabel: "Former Guardian of Planet Earth🐲", sloganUserLabel: "As Long As We Have Goku On Our Side, Victory Is Ours", linkUserLabel: "www.piccolo.com", postLabel: "Posts", followerLabel: "Followers", followingLabel: "Following", postCount: "576", followerCount: "21 M", followingCount: "745, 786")]
 
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
        followerTableView.register(FollowerTableViewCell.self, forCellReuseIdentifier: "FollowerTableViewCellID")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return followersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let followerCell = tableView.dequeueReusableCell(withIdentifier: "FollowerTableViewCellID",for: indexPath) as! FollowerTableViewCell
        followerCell.userNameLabel.text = followersArray[indexPath.row].followerUserName
        followerCell.nameLabel.text = followersArray[indexPath.row].followerName
        followerCell.followerImageView.image = followersArray[indexPath.row].followerImage
        return followerCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let profileViewController = ProfileViewController()
        //present(iMesaagesViewController, animated: true)
        profileViewController.follower = followersArray[indexPath.row]
        navigationController?.pushViewController(profileViewController, animated: true)
        //profileViewController.profileImageView.image = chatsArray[indexPath.row].senderImage(another way of passing data to a different screen)

        
    }

}


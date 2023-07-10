//
//  ViewController.swift
//  Profiles
//
//  Created by Reuben Simphiwe Kuse on 2023/06/30.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var profileArray: [Profile] = [Profile(followerImage: UIImage(named: "Vegeta")!, linkImage: UIImage(named: "link.png")!, followerName: "Vegeta", followerUserName: "Prince_of_Saiyans", professionUserLabel: "Prince🤴🏾", sloganUserLabel: "KAKAROT IS MY RIVAL.💪🏾👊🏾💪🏾", linkUserLabel: "www.princeofsaiyans.com", postLabel: "Posts", followerLabel: "Profiles", followingLabel: "Following", postCount: 1116, followerCount: 221, followingCount: 20),
                                      Profile(followerImage: UIImage(named: "Goku")!, linkImage: UIImage(named: "link.png")!, followerName: "Son Goku", followerUserName: "Goku_aka_Kakarot", professionUserLabel: "Champion Of The Universe Tournament of Power🥴", sloganUserLabel: "Kamehameha! I Know Vegeta Dont want no smoke with me😎", linkUserLabel: "www.supersaiyanultrainstinct.com", postLabel: "Posts", followerLabel: "Profiles", followingLabel: "Following", postCount: 0, followerCount: 87, followingCount: 1), Profile(followerImage: UIImage(named: "Piccolo")!, linkImage: UIImage(named: "link.png")!, followerName: "Piccolo", followerUserName: "Piccolo_The Namekian", professionUserLabel: "Former Guardian of Planet Earth🐲", sloganUserLabel: "As Long As We Have Goku On Our Side, Victory Is Ours", linkUserLabel: "www.piccolo.com", postLabel: "Posts", followerLabel: "Profiles", followingLabel: "Following", postCount: 576, followerCount: 21, followingCount: 745786)]
 
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
        return profileArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let followerCell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCellID",for: indexPath) as! ProfileTableViewCell
        followerCell.userNameLabel.text = profileArray[indexPath.row].followerUserName
        followerCell.nameLabel.text = profileArray[indexPath.row].followerName
        followerCell.followerImageView.image = profileArray[indexPath.row].followerImage
        return followerCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let profileViewController = ProfileViewController()
        //present(iMesaagesViewController, animated: true)
        profileViewController.profile = profileArray[indexPath.row]
        navigationController?.pushViewController(profileViewController, animated: true)
        //profileViewController.profileImageView.image = chatsArray[indexPath.row].senderImage(another way of passing data to a different screen)

        
    }

}


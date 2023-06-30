//
//  ViewController.swift
//  Followers
//
//  Created by Reuben Simphiwe Kuse on 2023/06/30.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
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
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let followerCell = tableView.dequeueReusableCell(withIdentifier: "FollowerTableViewCellID",for: indexPath) as! FollowerTableViewCell
        return followerCell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

}


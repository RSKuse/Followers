//
//  MessageComposeViewController.swift
//  Followers
//
//  Created by Reuben Simphiwe Kuse on 2023/09/05.
//

import Foundation
import UIKit

class MessageComposeViewController: UIViewController {
    
    lazy var messageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type your message here"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Compose Message"
        setupUI()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        
        
        func setupUI() {
            view.addSubview(messageTextField)
            
            messageTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
            messageTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            messageTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
            messageTextField.heightAnchor.constraint(equalToConstant: 120).isActive = true
        }
    }
    @objc func doneButtonTapped() {
        messageTextField.resignFirstResponder()
    }
}

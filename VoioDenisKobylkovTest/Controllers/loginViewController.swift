//
//  loginViewController.swift
//  VoioDenisKobylkovTest
//
//  Created by Denis Kobylkov on 28.03.2023.
//

import UIKit
import SnapKit
import FirebaseAuth
import FirebaseFirestore

class loginViewConctroller: UIViewController {
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "email"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 5
        textField.textAlignment = .center
        return textField
    }()
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 5
        textField.textAlignment = .center
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        return button
    }()
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemRed.cgColor
        return label
    }()
    
    private func setupview() {
        view.backgroundColor = .white
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(errorLabel)
        
        emailTextField.snp.makeConstraints{make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(200)
        }
        passwordTextField.snp.makeConstraints{make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField).inset(70)
        }
        loginButton.snp.makeConstraints{make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField).inset(70)
        }
        errorLabel.snp.makeConstraints{make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton).inset(70)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        loginButton.addTarget(self, action: #selector(clickToLogin), for: .touchUpInside)
    }
    
    @objc func clickToLogin() {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) {(result, error) in
            if error != nil {
                print("incorrect data")
            } else {
                self.navigationController?.pushViewController(TabsViewController(), animated: true)
            }
        }
    }
}

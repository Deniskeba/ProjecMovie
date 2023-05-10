//
//  signupViewController.swift
//  VoioDenisKobylkovTest
//
//  Created by Denis Kobylkov on 28.03.2023.
//

import UIKit
import SnapKit
import FirebaseAuth
import FirebaseFirestore

class signupViewConctroller: UIViewController {
    
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
    
    private let signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
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
        view.addSubview(signupButton)
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
        signupButton.snp.makeConstraints{make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField).inset(70)
        }
        errorLabel.snp.makeConstraints{make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(signupButton).inset(70)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        
        signupButton.addTarget(self, action: #selector(clickToSignUp), for: .touchUpInside)
    }
    
    
    func checkValid() -> String? {
        if passwordTextField.text == "" ||
            emailTextField.text == "" ||
            passwordTextField.text == nil ||
            emailTextField.text == nil {
            return "please fill in all fields"
        }
        return nil
    }
    @objc func clickToSignUp(){
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!)
            self.navigationController?.pushViewController(TabsViewController(), animated: true)

    }
}

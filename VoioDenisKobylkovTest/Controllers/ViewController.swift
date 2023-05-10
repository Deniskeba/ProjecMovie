//
//  ViewController.swift
//  VoioDenisKobylkovTest
//
//  Created by Denis Kobylkov on 28.03.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        return button
    }()
    private let signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        signupButton.addTarget(self, action: #selector(signupClicked), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginClicked), for: .touchUpInside)

    }
    @objc func signupClicked(){
        let signupViewController = signupViewConctroller()
        navigationController?.pushViewController(signupViewController, animated: true)
        
    }
    @objc func loginClicked(){
        let loginViewController = loginViewConctroller()
        navigationController?.pushViewController(loginViewController, animated: true)
        
    }
    
    
    
    private func setupView() {
        view.backgroundColor = .white
        navigationItem.title = "Welcome"
        view.addSubview(loginButton)
        view.addSubview(signupButton)
        
        loginButton.snp.makeConstraints{make in
            make.width.equalTo(80)
            make.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        signupButton.snp.makeConstraints{make in
            make.width.equalTo(80)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton).inset(50)
        }
        
    }

}


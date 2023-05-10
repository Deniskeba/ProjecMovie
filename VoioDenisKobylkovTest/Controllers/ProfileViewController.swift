//
//  ProfileViewController.swift
//  VoioDenisKobylkovTest
//
//  Created by Denis Kobylkov on 29.03.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.layer.cornerRadius = 50
        return image
    }()
    let nameLbl: UILabel = {
        let label = UILabel()
        label.text = "Denis"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    let surnameLbl: UILabel = {
        let label = UILabel()
        label.text = "Kobylkov"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        imageView.snp.makeConstraints {make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.top.equalTo(view.frame.size.height/7)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(nameLbl)
        nameLbl.snp.makeConstraints {make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.top.equalTo(imageView).inset(100)
            make.centerX.equalToSuperview()
        }
        
        
        view.addSubview(surnameLbl)
        surnameLbl.snp.makeConstraints {make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.top.equalTo(nameLbl).inset(50)
            make.centerX.equalToSuperview()
        }
        
    }
    
}

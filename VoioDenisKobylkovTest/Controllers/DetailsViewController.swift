//
//  DetailsViewController.swift
//  VoioDenisKobylkovTest
//
//  Created by Denis Kobylkov on 19.04.2023.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController {
    
  
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 3
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    let genreLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = label.font.withSize(20)
        
        return label
    }()
    let producerLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = label.font.withSize(20)
        return label
    }()
    let yearLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        return label
    }()
    let descritionLabel: UITextView = {
        let label = UITextView()
        label.text = ""
        label.backgroundColor = UIColor.init(white: 0, alpha: 0)
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.layer.masksToBounds = true
        return label
    }()
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .black
        iv.layer.cornerRadius = 20
        
        return iv
}()
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        imageView.snp.makeConstraints{make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.left.equalTo(20)
            make.width.equalTo(150)
            make.height.equalTo(200)
        }
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints{make in
            make.left.equalTo(imageView.snp.right).inset(-20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.width.equalTo(view.frame.size.width/2)
        }
        view.addSubview(genreLabel)
        genreLabel.snp.makeConstraints{make in
            make.left.equalTo(imageView.snp.right).inset(-20)
            make.top.equalTo(nameLabel.snp.bottom).inset(-10)
            make.width.equalTo(view.frame.size.width/2)
        }
        view.addSubview(producerLabel)
        producerLabel.snp.makeConstraints{make in
            make.left.equalTo(imageView.snp.right).inset(-20)
            make.top.equalTo(genreLabel.snp.bottom).inset(-10)
            make.width.equalTo(view.frame.size.width/2)
        }
        view.addSubview(descritionLabel)
        descritionLabel.snp.makeConstraints{make in
            make.top.equalTo(imageView.snp.bottom).inset(-30)
            make.left.equalTo(10)
            make.width.equalTo(view.frame.size.width - 20)
            make.height.equalTo(view.frame.size.height/2)
            
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientColor = CAGradientLayer()
        gradientColor.frame = view.bounds
        gradientColor.colors = [
            UIColor.systemOrange.cgColor,
            UIColor.systemRed.cgColor
        ]
        view.layer.addSublayer(gradientColor)
        setupView()

        
    }
}

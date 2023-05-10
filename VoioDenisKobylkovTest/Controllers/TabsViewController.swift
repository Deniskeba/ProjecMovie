//
//  MainViewController.swift
//  VoioDenisKobylkovTest
//
//  Created by Denis Kobylkov on 29.03.2023.
//

import UIKit
import SnapKit

class TabsViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTabs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setUpTabs(){
        let MainVC = MainViewController()
        let FavoriteVC = FavoriteViewController()
        let ProfileVC = ProfileViewController()
        
        let nav1 = UINavigationController(rootViewController: MainVC )
        let nav2 = UINavigationController(rootViewController: FavoriteVC)
        let nav3 = UINavigationController(rootViewController: ProfileVC )
        
        FavoriteVC.title = "Favorite"
        MainVC.title = "Main"
        ProfileVC.title = "Profile"
        nav1.tabBarItem = UITabBarItem(title: "Main",
                                       image: nil,
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "My Collection",
                                       image: nil,
                                       tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Profile",
                                       image: nil,
                                       tag: 3)
        setViewControllers([nav1, nav2, nav3], animated: true)
        
        

    }
    
}


//
//  TabBarController.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 23/12/2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newsListVC = NewsListModule.build()
        let usersListVC = UsersListModule.build()
        
        newsListVC.title = "Noticias"
        usersListVC.title = "Usuarios"
        
        self.setViewControllers([newsListVC, usersListVC], animated: true)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["newspaper", "person"]
        
        items[0].image = UIImage(systemName: images[0])
        items[1].image = UIImage(systemName: images[1])
    }
    
}

//
//  MainViewController.swift
//  appvk
//
//  Created by Дарья Шимко on 30.09.2020.
//

import UIKit
import WebKit

class MainViewController: UIViewController {
    
    var rootView = MainView()
    let tabBarCnt = UITabBarController()
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
              
        rootView.delegate = self
        view = rootView
        
    }
    
    
    func createTabbarController() {
        
        
        let friendsVC = FriendsTableViewController(style: .grouped)
        friendsVC.title = "friends"
        friendsVC.tabBarItem.image = UIImage(systemName: "person")
  
        let groupVC = GroupTableViewController(style: .grouped)
        groupVC.title = "groups"
        groupVC.tabBarItem = UITabBarItem.init(title: "groups", image: UIImage(systemName: "rectangle.stack"), tag: 0)
        
        let newsVC = NewsTableViewController()
        newsVC.title = "news"
        newsVC.tabBarItem = UITabBarItem.init(title: "news", image: UIImage(systemName: "tray.full"), tag: 0)
        
        let controllerArray = [friendsVC, groupVC, newsVC]
        tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
        
        self.view.addSubview(tabBarCnt.view)

    }
}









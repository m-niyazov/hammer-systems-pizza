//
//  MainTabBar.swift
//  hammer-systems-pizza
//
//  Created by Muhamed Niyazov on 09.05.2021.
//

import Foundation
import UIKit

class MainTabController: UITabBarController {
    
    //MARK: - Lifecylce
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTabBar()
        configureViewControllers()
    }
    
    func configureViewControllers(){
        let menuScreen =  MenuBuilder().makeScene()
        let navMenuScreen = addNavigationController(menuScreen, icon: "menu", title: "Меню")
        
        let contactsScreen =  ContactsController()
        let navContactsScreen = addNavigationController(contactsScreen, icon: "contacts", title: "Контакты")
        
        let accountScreen =  AccountController()
        let navAccountScreen = addNavigationController(accountScreen, icon: "account", title: "Профиль")
        
        let shoppingCartScreen =  ShoppingCartController()
        let navshoppingCartScreen = addNavigationController(shoppingCartScreen, icon: "shopping-cart", title: "Корзина")
        
        viewControllers = [navMenuScreen, navContactsScreen, navAccountScreen, navshoppingCartScreen]
    }
    
    func configureTabBar() {
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        tabBar.unselectedItemTintColor = .appGray
        tabBar.tintColor = .appRed
    }
    
    func addNavigationController(_ controller: UIViewController, icon: String, title: String) -> UIViewController {
        let controller = UINavigationController(rootViewController: controller)
        controller.tabBarItem.image = UIImage(named: icon)
        controller.tabBarItem.selectedImage =  UIImage(named: icon)
        controller.title = title
        return controller
    }
}

//
//  TabBarController.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 23.02.2022.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTabBarController()
        setupViewControllers()
    }
    
    private func setupTabBarController() {
        UITabBar.appearance().barTintColor = Constants.Colors.appGray
        tabBar.tintColor = Constants.Colors.whiteColor
        tabBar.unselectedItemTintColor = Constants.Colors.appDark
    }
    
    private func setupViewControllers() {
         viewControllers = [
            createNavigationController(for: CountriesHomeViewController(),
                                          title: "Home",
                                          image: UIImage(systemName: "house.fill")!),
            createNavigationController(for: CountriesSavedViewController(),
                                          title: "Saved",
                                          image: UIImage(systemName: "heart.fill")!)
        ]
    }
    
    fileprivate func createNavigationController(for rootViewController: UIViewController,
                                                title: String,
                                                image: UIImage) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        rootViewController.navigationItem.title = "Countries"
        return navigationController
    }
}


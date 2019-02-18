//
//  AppDelegate.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 31/01/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabBarDetailControllers: [UINavigationController]!
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.makeKeyAndVisible()
        window?.backgroundColor = .red
        
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        
        // Creamos los controladores (master && detail de la tabla
        let houseListViewController = HouseListViewController(model: houses)
        let seasonListViewController = SeasonListViewController(model: seasons)
        
        
        // Recuperamos la última casa seleccionada (si hay alguna)
        let lastHouseSelected = houseListViewController.lastSelectedHouse()
        
        let houseDetailViewController = HouseDetailViewController(model: lastHouseSelected)
        let seasonDetailViewController = SeasonDetailViewController(model: seasons.first!)
        
        tabBarDetailControllers = [
            houseDetailViewController.wrappedInNavigation(),
            seasonDetailViewController.wrappedInNavigation()
        ]
        
        
        houseListViewController.delegate = houseDetailViewController
        seasonListViewController.delegate = seasonDetailViewController
        
        // Creamos el TabBarController y asignamos controladores
        let tabBarController = UITabBarController()
        tabBarController.delegate = self
        tabBarController.viewControllers = [
            houseListViewController.wrappedInNavigation(),
            seasonListViewController.wrappedInNavigation()
        ]
        
        // Creamos el split view controller y asignamos controladores
        let splitViewController = UISplitViewController()
        splitViewController.delegate = self
        splitViewController.preferredDisplayMode = .primaryOverlay
        splitViewController.preferredDisplayMode = .allVisible
        splitViewController.viewControllers = [tabBarController, tabBarDetailControllers.first!]
        
        // Asignamos el rootViewController del window
        window?.rootViewController = splitViewController
        
        return true
    }
}

extension AppDelegate: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}

extension AppDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if let splitViewController = window?.rootViewController as? UISplitViewController, splitViewController.viewControllers.count > 1 {
            splitViewController.viewControllers[1] = tabBarDetailControllers[tabBarController.selectedIndex]
        }
        
    }
}



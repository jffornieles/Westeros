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


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setUpView()
        
        return true
    }
    
    func setUpView() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.makeKeyAndVisible()
        window?.backgroundColor = .red
        
        let houses = Repository.local.houses
        
        // Creamos un UITabBarController
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = houses.map { HouseDetailViewController(model: $0).wrappedInNavigation() }
        
        // Asignamos el rootViewController del window
        window?.rootViewController = tabBarController
    }
}


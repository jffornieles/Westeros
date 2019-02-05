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
        
        // Creamos los modelos
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing.png")!, description: "Lobe Huargo")
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        
        let lannisterSigil = Sigil(image: UIImage(named: "lannister")!, description: "León Rampante")
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido")
        
        // Creamos los controladores
        let starkViewController = HouseDetailViewController(model: starkHouse)
        let lannisterViewController = HouseDetailViewController(model: lannisterHouse)
        
        // Creamos un UITabBarController
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [starkViewController.wrappedInNavigation(), lannisterViewController.wrappedInNavigation()]
        
        // Creamos un UINavigationController
        // let starkNavigationViewController = UINavigationController(rootViewController: starkViewController)
        
        // Asignamos el rootViewController del window
        window?.rootViewController = tabBarController
    }
}


//
//  UIViewController+Navigation.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 05/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import UIKit

extension UIViewController {
    func wrappedInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}

//
//  Sigil.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 31/01/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import UIKit

final class Sigil {
    
    // MARK: Properties
    let descripcion: String
    let image: UIImage
    
    // MARK: Initializacion
    init(image: UIImage, description: String) {
        self.descripcion = description
        self.image = image
    }
}

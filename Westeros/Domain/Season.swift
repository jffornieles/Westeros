//
//  Season.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 13/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import Foundation

class Season {
    let name: String
    let releaseDate: Date
    let episodes: Episode
    
    init(name: String, releaseDate: Date, episodes: Episode) {
        self.name = name
        self.releaseDate = releaseDate
        self.episodes = episodes
    }
}

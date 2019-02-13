//
//  Season.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 13/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import UIKit

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

extension Season {
    
    var proxyForEquality: String {
        return "\(name) \(releaseDate) \(episodes)"
    }
    
    var proxyForComparison: String {
        return "\(name) \(episodes.title)"
    }
}

extension Season: Equatable {
    static func == (lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }    
}

extension Season: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension Season: Comparable {
    static func < (lhs: Season, rhs: Season) -> Bool {
       return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

extension Season: CustomStringConvertible {
    var description: String {
        return "Name: \(name), Release Date: \(releaseDate), episodes: \(episodes.title)"
    }
}



//
//  Season.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 13/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import UIKit

typealias Episodes = Set<Episode>

class Season {
    
    let name: String
    let releaseDate: Date
    private var _episodes: Episodes
    var numberOfEpisodesForSeason: Int { return count }
    
    init(name: String, releaseDate: Date) {
        self.name = name
        self.releaseDate = releaseDate
        _episodes = Episodes()
    }
}

extension Season {
    
    var sortedEpisodes: [Episode] {
        return _episodes.sorted()
    }
    
    var count: Int {
        return _episodes.count
    }
    
    func add(episode: Episode) {
        guard episode.season == self else {
            return
        }
        _episodes.insert(episode)
    }
    
    func add(episodes: Episode...) {
        episodes.forEach { add(episode: $0) }
    }
}

extension Season {
    
    var proxyForEquality: String {
        return "\(name) \(releaseDate) \(_episodes)"
    }
    
    var proxyForComparison: String {
        return "\(name) \(releaseDate)"
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
        return "Name: \(name), Release Date: \(releaseDate)"
    }
}



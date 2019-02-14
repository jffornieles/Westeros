//
//  Episode.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 13/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import Foundation

class Episode {
    let title: String
    let issueDate: Date
    weak var season: Season?
    
    init(title: String, issueDate: Date, season: Season?) {
        self.title = title
        self.issueDate = issueDate
        self.season = season
    }
}

extension Episode {
    var proxyForEquality: String {
       return "\(title) \(issueDate)"
    }
    
    var proxyForComparison: String {
        return "\(title)"
    }
}

extension Episode: Equatable {
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Episode: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension Episode: Comparable {
    static func < (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
    
}

extension Episode: CustomStringConvertible {
    var description: String {
        return "Title: \(title), IssueDate: \(issueDate)"
    }
    
    
}

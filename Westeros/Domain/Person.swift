//
//  Character.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 31/01/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import Foundation

final class Person {
    
    // MARK: Properties
    let name: String
    private let _alias: String?
    let house: House
    
    var alias: String { return _alias ?? "" }
    
    // MARK: Initialization
    init(name: String, alias: String? = nil, house: House) {
        self.name = name
        self._alias = alias
        self.house = house
        self.house.add(person: self)
    }    
}

extension Person {
    var fullName: String {
        return "\(name) \(house.name)"
    }
}

extension Person {
    var proxyForEquality: String {
        return "\(name) \(alias) \(house.name)"
    }
    
    var proxyForComparison: String {
        return fullName
    }
}

extension Person: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Person: Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
    
}

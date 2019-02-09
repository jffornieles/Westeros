//
//  Repository.swift
//  Westeros
//
//  Created by Jose Francisco Fornieles on 06/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import UIKit

final class Repository {
    static let local = LocalFactory()
}

protocol HouseFactory {
    
    typealias HouseFilter = (House) -> Bool
    
    var houses: [House] { get }
    
    func house(named: String) -> House?
    
    func houses(filteredBy: HouseFilter) -> [House]
}

final class LocalFactory: HouseFactory {
    
    var houses: [House] {
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing")!, description: "Lobo Huargo")
        let lannisterSigil = Sigil(image: UIImage(named: "lannister")!, description: "León Rampante")
        let targaryenSigil = Sigil(image: UIImage(named: "targaryenSmall")!, description: "Dragón Tricéfalo")
        
        let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", wikiURL: starkURL)
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", wikiURL: lannisterURL)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y Sangre", wikiURL: targaryenURL)
        
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El mata reyes", house: lannisterHouse)
        let dani = Person(name: "Daenerys", alias: "Madre de dragones", house: targaryenHouse)
        
        starkHouse.add(persons: robb, arya)
        lannisterHouse.add(persons: tyrion, cersei, jaime)
        targaryenHouse.add(person: dani)
        
        return [targaryenHouse, starkHouse, lannisterHouse].sorted()
    }
    
    func house(named name: String) -> House? {
        let house = houses.first{ $0.name.uppercased() == name.uppercased()}
        return house
    }
    
    func houses(filteredBy theFilter: (House) -> Bool) -> [House] {
        return houses.filter(theFilter)
    }
}

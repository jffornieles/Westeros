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

protocol SeasonFactory {
    
    typealias SeasonFilter = (Season) -> Bool
    
    var seasons: [Season] { get }
    
    func season(named: String) -> Season?
}

final class LocalFactory: HouseFactory, SeasonFactory {
    

    // MARK: - Season Factory
    var seasons: [Season] {

        
        let season1 = Season(name: "Season 1", releaseDate: Date())
        let season2 = Season(name: "Season 2", releaseDate: Date())
        let season3 = Season(name: "Season 3", releaseDate: Date())
        let season4 = Season(name: "Season 4", releaseDate: Date())
        let season5 = Season(name: "Season 5", releaseDate: Date())
        let season6 = Season(name: "Season 6", releaseDate: Date())
        let season7 = Season(name: "Season 7", releaseDate: Date())
        
        
        let episode1Season1 = Episode(title: "Winter is Comming", issueDate: Date(), season: season1)
        let episode2Season1 = Episode(title: "The Kingsroad", issueDate: Date(), season: season1)
        let episode1Season2 = Episode(title: "The North Remembers", issueDate: Date(), season: season2)
        let episode2Season2 = Episode(title: "The Night Lands", issueDate: Date(), season: season2)
        let episode1Season3 = Episode(title: "Valar Dohaeris", issueDate: Date(), season: season3)
        let episode2Season3 = Episode(title: "Dark Wings, Dark Words", issueDate: Date(), season: season3)
        let episode1Season4 = Episode(title: "Two Swords", issueDate: Date(), season: season4)
        let episode2Season4 = Episode(title: "The Lion and the Rose", issueDate: Date(), season: season4)
        let episode1Season5 = Episode(title: "Winter is Comming", issueDate: Date(), season: season5)
        let episode2Season5 = Episode(title: "The Kingsroad", issueDate: Date(), season: season5)
        let episode1Season6 = Episode(title: "The North Remembers", issueDate: Date(), season: season6)
        let episode2Season6 = Episode(title: "The Night Lands", issueDate: Date(), season: season6)
        let episode1Season7 = Episode(title: "Valar Dohaeris", issueDate: Date(), season: season7)
        let episode2Season7 = Episode(title: "Dark Wings, Dark Words", issueDate: Date(), season: season7)
        
        season1.add(episodes: episode1Season1, episode2Season1)
        season2.add(episodes: episode1Season2, episode2Season2)
        season3.add(episodes: episode1Season3, episode2Season3)
        season4.add(episodes: episode1Season4, episode2Season4)
        season5.add(episodes: episode1Season5, episode2Season5)
        season6.add(episodes: episode1Season6, episode2Season6)
        season7.add(episodes: episode1Season7, episode2Season7)
        
        return [season1, season2, season3, season4, season5, season6, season7].sorted()
        
    }
    
    func season(named name: String) -> Season? {
        let season = seasons.first {$0.name.uppercased() == name.uppercased()}
        return season
    }
    
    // MARK: - House Factory
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

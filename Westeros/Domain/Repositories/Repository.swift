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

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        
        let season1 = Season(name: "Season 1", releaseDate: dateFormatter.date(from: "2011-04-17")!)
        let season2 = Season(name: "Season 2", releaseDate: dateFormatter.date(from: "2012-04-01")!)
        let season3 = Season(name: "Season 3", releaseDate: dateFormatter.date(from: "2013-03-31")!)
        let season4 = Season(name: "Season 4", releaseDate: dateFormatter.date(from: "2014-04-06")!)
        let season5 = Season(name: "Season 5", releaseDate: dateFormatter.date(from: "2015-04-12")!)
        let season6 = Season(name: "Season 6", releaseDate: dateFormatter.date(from: "2016-04-24")!)
        let season7 = Season(name: "Season 7", releaseDate: dateFormatter.date(from: "2017-06-16")!)
        
        
        let episode1Season1 = Episode(title: "Winter is Comming", issueDate: dateFormatter.date(from: "2011-04-17")!, season: season1, summary: "Summary", directedBy: "Tim Van Patten", writedBy: "David Benioff & D. B. Weiss")
        let episode2Season1 = Episode(title: "The Kingsroad", issueDate: dateFormatter.date(from: "2011-04-24")!, season: season1, summary: "Summary", directedBy: "Tim Van Patten", writedBy: "David Benioff & D. B. Weiss")
        let episode1Season2 = Episode(title: "The North Remembers", issueDate: dateFormatter.date(from: "2012-04-01")!, season: season2, summary: "Summary", directedBy: "Alan Taylor", writedBy: "David Benioff & D. B. Weiss")
        let episode2Season2 = Episode(title: "The Night Lands", issueDate: dateFormatter.date(from: "2012-04-08")!, season: season2, summary: "Summary", directedBy: "Alan Taylor", writedBy: "David Benioff & D. B. Weiss")
        let episode1Season3 = Episode(title: "Valar Dohaeris", issueDate: dateFormatter.date(from: "2013-03-31")!, season: season3, summary: "Summary", directedBy: "Daniel Minahan", writedBy: "David Benioff & D. B. Weiss")
        let episode2Season3 = Episode(title: "Dark Wings, Dark Words", issueDate: dateFormatter.date(from: "2013-04-07")!, season: season3, summary: "Summary", directedBy: "Daniel Minahan", writedBy: "Vanessa Taylor")
        let episode1Season4 = Episode(title: "Two Swords", issueDate: dateFormatter.date(from: "2014-04-06")!, season: season4, summary: "Summary", directedBy: "D. B. Weiss", writedBy: "David Benioff y D. B. Weiss")
        let episode2Season4 = Episode(title: "The Lion and the Rose", issueDate: dateFormatter.date(from: "2014-04-13")!, season: season4, summary: "Summary", directedBy: "Alex Graves", writedBy: "George R. R. Martin")
        let episode1Season5 = Episode(title: "The Wars to Come", issueDate: dateFormatter.date(from: "2015-04-12")!, season: season5, summary: "Summary", directedBy: "Michael Slovis", writedBy: "David Benioff & D. B. Weiss")
        let episode2Season5 = Episode(title: "The House of Black and White", issueDate: dateFormatter.date(from: "2015-04-19")!, season: season5, summary: "Summary", directedBy: "Michael Slovis", writedBy: "David Benioff & D. B. Weiss")
        let episode1Season6 = Episode(title: "The Red Woman", issueDate: dateFormatter.date(from: "2016-04-24")!, season: season6, summary: "Summary", directedBy: "Jeremy Podeswa", writedBy: "David Benioff & D. B. Weiss")
        let episode2Season6 = Episode(title: "Home", issueDate: dateFormatter.date(from: "2016-05-01")!, season: season6, summary: "Summary", directedBy: "Jeremy Podeswa", writedBy: "Dave Hill")
        let episode1Season7 = Episode(title: "Dragonstone", issueDate: dateFormatter.date(from: "2017-06-16")!, season: season7, summary: "Summary", directedBy: "Jeremy Podeswa", writedBy: "David Benioff & D. B. Weiss")
        let episode2Season7 = Episode(title: "Stormborn", issueDate: dateFormatter.date(from: "2017-06-23")!, season: season7, summary: "Summary", directedBy: "Mark Mylod", writedBy: "Bryan Cogman")
        
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

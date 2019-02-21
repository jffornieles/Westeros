//
//  SeasonTest.swift
//  WesterosTests
//
//  Created by Jose Francisco Fornieles on 13/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import XCTest
@testable import Westeros

var dateFormatter: DateFormatter!

class SeasonTest: XCTestCase {

    var episode1: Episode!
    var episode2: Episode!
    var episode2x1: Episode!
    var season: Season!
    var seasonTwo: Season!
    
    override func setUp() {
        
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        season = Season(name: "Season one", releaseDate: dateFormatter.date(from: "2019-02-28")!)
        seasonTwo = Season(name: "Season two", releaseDate: dateFormatter.date(from: "2019-02-28")!)
        
        episode1 = Episode(title: "Episode 1", issueDate: dateFormatter.date(from: "2019-02-28")!, season: season)
        episode2 = Episode(title: "Episode 2", issueDate: dateFormatter.date(from: "2019-02-28")!, season: season)
        episode2x1 = Episode(title: "Episode 1", issueDate: dateFormatter.date(from: "2019-02-28")!, season: seasonTwo)
        
    }

    override func tearDown() {
        
    }
    
    func testSeason_SeasonExists_SeasonIsNotNill() {
        XCTAssertNotNil(season)
    }
    
    func testSeason_Hashable_IsNotNill() {
        XCTAssertNotNil(season.hashValue)
    }
    
    func testSeason_Comparable_IsLessThan() {        
        XCTAssertLessThan(season, seasonTwo)
    }
    
    func testSeason_Equality_IsEqualOrNotEqual() {
        // Identidad
        XCTAssertEqual(season, season)
        // Igualdad
        let seasonAux = Season(name: "Season one", releaseDate: dateFormatter.date(from: "2019-02-28")!)
        XCTAssertEqual(season.name, seasonAux.name)
        XCTAssertEqual(season.releaseDate, seasonAux.releaseDate)
        // Desigualdad
        XCTAssertNotEqual(season, seasonTwo)
    }
    
    func testSeason_CustomStringConvertible_IsNotNill() {
        XCTAssertNotNil(season.description)
    }
    
    func testSeason_AddPerson() {
        // season.add(episode: episode1)
        XCTAssertEqual(season.count, 2)
        
        season.add(episode: episode2)
        XCTAssertEqual(season.count, 2)
        
        season.add(episode: episode2x1)
        XCTAssertEqual(season.count, 2)
    }
    
    func testSeason_AddPersonAtOnce() {
        season.add(episodes: episode1, episode2, episode2x1)
        XCTAssertEqual(season.count, 2)
    }

}

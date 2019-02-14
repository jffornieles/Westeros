//
//  SeasonTest.swift
//  WesterosTests
//
//  Created by Jose Francisco Fornieles on 13/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTest: XCTestCase {

    var episode1: Episode!
    var episode2: Episode!
    var episode2x1: Episode!
    var season: Season!
    var seasonTwo: Season!
    
    override func setUp() {
        season = Season(name: "Season one", releaseDate: Date())
        seasonTwo = Season(name: "Season two", releaseDate: Date())
        
        episode1 = Episode(title: "Episode 1", issueDate: Date(), season: season)
        episode2 = Episode(title: "Episode 2", issueDate: Date(), season: season)
        episode2x1 = Episode(title: "Episode 1", issueDate: Date(), season: seasonTwo)
        
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
        let seasonAux = Season(name: "Season one", releaseDate: Date())
        XCTAssertEqual(season, seasonAux)
        // Desigualdad
        XCTAssertNotEqual(season, seasonTwo)
    }
    
    func testSeason_CustomStringConvertible_IsNotNill() {
        XCTAssertNotNil(season.description)
    }
    
    func testSeason_AddPerson() {
        season.add(episode: episode1)
        XCTAssertEqual(season.count, 1)
        
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

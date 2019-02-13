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

    var episode: Episode!
    var season: Season!
    var seasonTwo: Season!
    
    override func setUp() {
        episode = Episode(title: "Episode 1", issueDate: Date())
        season = Season(name: "Season one", releaseDate: Date(), episodes: episode)
        seasonTwo = Season(name: "Season two", releaseDate: Date(), episodes: episode)
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
        let seasonAux = Season(name: "Season one", releaseDate: Date(), episodes: episode)
        XCTAssertEqual(season, seasonAux)
        // Desigualdad
        XCTAssertNotEqual(season, seasonTwo)
    }
    
    func testSeason_CustomStringConvertible () {
        XCTAssertNotNil(season.description)
    }

}

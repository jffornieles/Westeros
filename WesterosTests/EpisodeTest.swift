//
//  EpisodeTest.swift
//  WesterosTests
//
//  Created by Jose Francisco Fornieles on 13/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import XCTest

@testable import Westeros

class EpisodeTest: XCTestCase {
    
    var episode: Episode!
    var episodeTwo: Episode!

    override func setUp() {
        episode = Episode(title: "Episode 1", issueDate: Date(), season: nil)
        episodeTwo = Episode(title: "Episode 2", issueDate: Date(), season: nil)
    }

    override func tearDown() {
        
    }

    func testEpisode_EpisodeExists_EpisodeIsNotNill() {
        XCTAssertNotNil(episode)
    }
    
    func testEpisode_EpisodeEquality_IsEqualOrNotEqual() {
        // Identidad
        XCTAssertEqual(episode, episode)
        
        // Igualdad
        let episodeAux = Episode(title: "Episode 1", issueDate: Date(), season: nil)
        XCTAssertEqual(episode, episodeAux)
        
        // Desigualdad
        XCTAssertNotEqual(episode, episodeTwo)
    }
    
    func testEpisode_Hashable_IsNotNill() {
        XCTAssertNotNil(episode.hashValue)
    }
    
    func testEpisode_Comparable_IsLessThan() {
        XCTAssertLessThan(episode, episodeTwo)
    }
    
    func testEpisode_CustomStringConvertile_IsNotNill() {
        XCTAssertNotNil(episode.description)
    }
    
    func testEpisodeList_EpisodeListExists_EpisodeListIsNotNull() {
        XCTAssertNotNil([episode, episodeTwo])
    }
    
    func testEpisodeDetail_EpisodeDetailExists_EpisodeDetailIsNotNull() {
        XCTAssertNotNil(episode)
    }
}

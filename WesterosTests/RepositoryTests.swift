//
//  RepositoryTests.swift
//  WesterosTests
//
//  Created by Jose Francisco Fornieles on 06/02/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {

    var houses: [House]!
    
    override func setUp() {
        houses = Repository.local.houses
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLocalRepositoryExistence() {
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHouseExistence() {
        XCTAssertNotNil(houses)
    }
    
    func testLocalRepositoryHouseCount() {
        XCTAssertEqual(houses.count, 3)
    }
    
    func testLocalRepositoryReturnsSortedArrayOfHouses() {
        XCTAssertEqual(houses, houses.sorted())
    }
    
    func testLocalRepositoryReturnsHousesByNameCaseInSensitively() {
        let stark = Repository.local.house(named: "stArk")
        XCTAssertNotNil(stark)
        XCTAssertEqual(stark?.name, "Stark")
        
        let keepcoding = Repository.local.house(named: "Keepcoding")
        XCTAssertNil(keepcoding)
    }
    // GIVEN - WHEN - THEN
    func testLocalRepository_HousesFilterBy_ReturnsTheCorrectValue() {
        let filtered = Repository.local.houses { $0.count == 1 }
        
        XCTAssertEqual(filtered.count, 1)
    }
    
    func testLocalRepository_HouseNamed_ReturnsTheCorrectValue() {
        
        let house = Repository.local.house(named: .targaryen)
        
        XCTAssertNotNil(house)
        XCTAssertEqual(house?.name, "Targaryen")
        XCTAssertNotEqual(house?.name, "Mi casa")
    }

}

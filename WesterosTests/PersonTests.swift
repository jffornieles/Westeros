//
//  CharacterTests.swift
//  WesterosTests
//
//  Created by Jose Francisco Fornieles on 31/01/2019.
//  Copyright © 2019 Jose Francisco Fornieles. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTests: XCTestCase {

    var starkHouse: House!
    var starkSigil: Sigil!
    var ned: Person!
    var character: Person!
    var arya: Person!
    
    override func setUp() {
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", wikiURL: starkURL)
        ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        character = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
    }

    override func tearDown() {
        
    }

    func testCharacterExistence() {
        XCTAssertNotNil(character)
    }
    
    func testPersonHasFullName() {
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
    
    func testPersonHashable() {
        XCTAssertNotNil(ned.hashValue)
    }
    
    func testPersonEquality() {
        // Identidad
        XCTAssertEqual(ned, ned)
        
        // Igualdad
        let eddard = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        XCTAssertEqual(eddard, ned)
        
        // Desigualdad
        XCTAssertNotEqual(ned, arya)
    }
}

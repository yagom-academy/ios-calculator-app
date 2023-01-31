//
//  ExtensionStringTests.swift
//  ExtensionStringTests
//
//  Created by jiye Yi on 2023/01/28.
//

import XCTest
@testable import Calculator
final class ExtensionStringTests: XCTestCase {

    func test_split을_실행하면_character를기준으로_나뉜값이_배열로_반환된다() {
        //given
        let character: Character = " "
        let expectation: [String] = ["1", "2345", "67"]
        
        //when
        let testString: String = "1 2345 67"
        let result = testString.split(with: character)
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_character가연속적으로있을때_character를기준으로_나뉜값이_배열로_반환된다() {
        //given
        let character: Character = "!"
        let expectation: [String] = ["1", "23"]
        
        //when
        let testString: String = "1!!23"
        let result = testString.split(with: character)
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_character가_처음과마지막에있을때_사이값이_반환된다() {
        //given
        let character: Character = "!"
        let expectation: [String] = ["123"]
        
        //when
        let testString: String = "!123!"
        let result = testString.split(with: character)
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
}

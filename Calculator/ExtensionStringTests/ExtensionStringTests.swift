//
//  ExtensionStringTests.swift
//  ExtensionStringTests
//
//  Created by jiye Yi on 2023/01/28.
//

import XCTest
@testable import Calculator
final class ExtensionStringTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func test_split을_실행하면_character를기준으로_나뉜값이_배열로_반환된다() {
        //given
        let input: Character = " "
        let expectation: [String] = ["1", "2345", "67"]
        
        //when
        let testString: String = "1 2345 67"
        let result = testString.split(with: input)
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
}

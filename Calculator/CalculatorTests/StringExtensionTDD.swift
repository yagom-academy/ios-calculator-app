//
//  StringExtensionTDD.swift
//  CalculatorTests
//
//  Created by LeeChiheon on 2022/05/20.
//

import XCTest

class StringExtensionTDD: XCTestCase {
    
    var str: String!
    
    override func setUpWithError() throws {
        str = String()
    }

    override func tearDownWithError() throws {
        str = nil
    }

    func test_character로_문자열나누기() throws {
        // given
        let inputStr = "1 2 3 4 5 6"
        let expectation = ["1", "2", "3", "4", "5", "6"]

        // when
        
        // then
        for (splitedStr, expectationStr) in zip(inputStr.split(with: " "), expectation) {
            XCTAssertEqual(splitedStr, expectationStr)
        }
    }
}

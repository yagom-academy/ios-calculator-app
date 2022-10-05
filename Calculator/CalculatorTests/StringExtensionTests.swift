//
//  StringExtensionTests.swift
//  CalculatorTests
//
//  Created by 이정민 on 2022/09/23.
//

import XCTest
@testable import Calculator

final class StringExtensionTests: XCTestCase {

    func test_when_given_testString_then_expect_String_separated_by_specific_character() {
        // given
        let testString = "1+23-4"
        let resultString1 = ["1", "+", "23-4"]
        let resultString2 = ["1+23", "-", "4"]
        
        // when
        let result1 = testString.split(with: "+")
        let result2 = testString.split(with: "-")
        
        // then
        XCTAssertEqual(result1, resultString1)
        XCTAssertEqual(result2, resultString2)
    }
}

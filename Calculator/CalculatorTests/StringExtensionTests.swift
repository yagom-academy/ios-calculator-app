//
//  StringExtensionTests.swift
//  CalculatorTests
//
//  Created by 이정민 on 2022/09/23.
//

import XCTest
@testable import Calculator

final class StringExtensionTests: XCTestCase {

    func test_When_testString_split_Then_return_String_that_except_specific_character() {
        // given
        let testString = "1+23-4"
        let resultString_1 = ["1", "+", "23-4"]
        let resultString_2 = ["1+23", "-", "4"]
        
        // when
        let result_1 = testString.split(with: "+")
        let result_2 = testString.split(with: "-")
        
        // then
        XCTAssertEqual(result_1, resultString_1)
        XCTAssertEqual(result_2, resultString_2)
    }
}

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
        let testString = "1+23"
        let resultString = ["1", "23"]
        
        // when
        let result = testString.split(with: "+")
        
        // then
        XCTAssertEqual(result, resultString)
    }
}

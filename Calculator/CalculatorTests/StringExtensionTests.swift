//
//  StringExtensionTests.swift
//  CalculatorTests
//
//  Created by 예거 on 2021/11/16.
//

import XCTest

class StringExtensionTests: XCTestCase {

    func test_split메서드가_String에서_공백_제거하고_배열로_반환하는지() {
        let input = "123.3 × -12.233 ÷ 10 + -152.25 - -0.1"
        let result = input.split(with: ExpressionParser.whiteSpace)
        let expectation = ["123.3", "×", "-12.233", "÷", "10", "+", "-152.25", "-", "-0.1"]
        XCTAssertEqual(result, expectation)
    }
}

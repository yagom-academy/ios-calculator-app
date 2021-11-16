//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 예거 on 2021/11/16.
//

import XCTest

class ExpressionParserTests: XCTestCase {
    
    func test_componentsByOperators메서드가_String에서_연산자만_필터링하는지() {
        let input = "123.3 × -12.233 ÷ 10 + -152.25 - -0.1"
        let result = ExpressionParser.componentsByOperators(from: input)
        let expectation = ["×", "÷", "+", "-"]
        XCTAssertEqual(result, expectation)
    }
}

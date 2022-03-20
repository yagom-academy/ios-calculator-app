//
//  ExpressionParserTests.swift
//  Tests
//
//  Created by mmim.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    func test_calculation() {
        // given
        let someInput = "1 + 2 - -3 "
        var expressionParser = ExpressionParser.parse(from: someInput)
        // when
        let result = expressionParser.result()
        // then
        XCTAssertEqual(result, 6.0)
    }
    
    func test_calculation_연산자로_끝나는_경우() {
        // given
        let someInput = "1 + 2 - -3 + "
        var expressionParser = ExpressionParser.parse(from: someInput)
        // when
        let result = expressionParser.result()
        // then
        XCTAssertEqual(result, 6.0)
    }
    
    func test_calculation_0으로_나누는_경우() {
        // given
        let someInput = "1 + 2 ÷ 0 "
        var expressionParser = ExpressionParser.parse(from: someInput)
        // when
        let result = expressionParser.result()
        // then
        XCTAssertTrue(result.isNaN)
    }
}

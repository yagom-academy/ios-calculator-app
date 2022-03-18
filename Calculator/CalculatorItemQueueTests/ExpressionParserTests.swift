//
//  ExpressionParserTests.swift
//  CalculatorItemQueueTests
//
//  Created by 조민호 on 2022/03/18.
//

import XCTest

class ExpressionParserTests: XCTestCase {
    let mockExpression = "1 + 2 - 3 / 4 * -5"

    func test_parse를호출할때_operands의카운트값이예상값과같아야한다() {
        // given
        // when
        let formula = ExpressionParser.parse(from: mockExpression)
        
        // then
        let result = formula.operands.count
        let expected = 5
        XCTAssertEqual(result, expected)
    }
    
    func test_parse를호출할때_operators의카운트값이예상값과같아야한다() {
        // given
        // when
        let formula = ExpressionParser.parse(from: mockExpression)
        
        // then
        let result = formula.operators.count
        let expected = 4
        XCTAssertEqual(result, expected)
    }
}

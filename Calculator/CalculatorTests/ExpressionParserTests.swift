//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Rowan on 2023/01/27.
//

import XCTest

final class ExpressionParserTests: XCTestCase {
    func test_parse호출시_전달한String이나눠들어간Fomula를반환한다() {
        // given
        let input = "1 + 2 + 3"
        let expectedOperandsCount = 3
        let expectedOperatorCount = 2
        
        // when
        let result = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(result.operands.itemCount, expectedOperandsCount)
        XCTAssertEqual(result.operators.itemCount, expectedOperatorCount)
    }
    
    func test_parse호출시_전달한String에_음수가있어도_예상된Fomula를반환한다() {
        // given
        let input = "-1 + -2 + 3"
        let expectedOperandsCount = 3
        let expectedOperatorCount = 2
        
        // when
        let result = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(result.operands.itemCount, expectedOperandsCount)
        XCTAssertEqual(result.operators.itemCount, expectedOperatorCount)
    }
}

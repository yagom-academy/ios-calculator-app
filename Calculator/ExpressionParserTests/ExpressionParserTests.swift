//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Seoyeon Hong on 2023/02/01.
//

import XCTest

final class ExpressionParserTests: XCTestCase {
    
    func test_parse_inputOperandsandOperator_returnEachValue() {
        //given
        let input = "1 + 2.0 - 3 ÷ -4 x 5.5"
        
        //when
        let formula = ExpressionParser.parse(from: input)
        var operands = formula.operands
        var operators = formula.operators
        
        //then
        XCTAssertEqual(1, operands.dequeue())
        XCTAssertEqual(2.0, operands.dequeue())
        XCTAssertEqual(3, operands.dequeue())
        XCTAssertEqual(-4, operands.dequeue())
        XCTAssertEqual(5.5, operands.dequeue())
        
        XCTAssertEqual(Operator.add, operators.dequeue())
        XCTAssertEqual(Operator.subtract, operators.dequeue())
        XCTAssertEqual(Operator.divide, operators.dequeue())
        XCTAssertEqual(Operator.multiply, operators.dequeue())
    }
    
    func test_parse_inputOperandsAndOperators_returnNegative9() {
        // given
        let input = "1 + 2 x -3"
        // when
        var formula = ExpressionParser.parse(from: input)
        let output = formula.result()
        // then
        XCTAssertEqual(output, -9.0)
    }
    
    func test_parse_inputOperandsAndOperators_returnPositive9() {
        // given
        let input = "1 + 2 x 3"
        // when
        var formula = ExpressionParser.parse(from: input)
        let output = formula.result()
        // then
        XCTAssertEqual(output, 9.0)
    }
    
    
    func test_parse_inputOperandsAnddeivideWithZero_returnIsNan() {
        // given
        let input = "1 ÷ 0"
        
        // when
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()
        
        // then
        XCTAssertTrue(result.isNaN)
    }
    
}

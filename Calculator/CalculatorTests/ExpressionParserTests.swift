//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by Minsup on 2023/06/01.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    func test_간단하고_정상적인_문자열_수식을_parse_하면_Formula_객체안에_연산자와_피연산자가_분리되어_순서대로_queue에_쌓인다() throws {
        // given
        let input = "5+3"
        let expectation = Formula(operands: [5, 3], operators: [.add])
        
        // when
        let result = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(result.operands.elements, expectation.operands.elements)
        XCTAssertEqual(result.operators.elements, expectation.operators.elements)
    }
    
    func test_복잡하고_정상적인_문자열_수식을_parse_하면_Formula_객체안에_연산자와_피연산자가_분리되어_순서대로_queue에_쌓인다() throws {
        // given
        let input = "5+3×2.5÷10-30.14"
        let expectation = Formula(
            operands: [5, 3, 2.5, 10, 30.14],
            operators: [.add, .multiply, .divide, .subtract]
        )
        
        // when
        let result = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(result.operands.elements, expectation.operands.elements)
        XCTAssertEqual(result.operators.elements, expectation.operators.elements)
    }
}

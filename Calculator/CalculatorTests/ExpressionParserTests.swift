//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 이정민 on 2022/09/23.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    
    func test_When_generate_parse_Then_expect_Not_nil() {
        // given
        let testString = "1+2+3"
        
        // when
        let result = ExpressionParser.parse(from: testString)
        
        // then
        XCTAssertNotNil(result)
    }
    
    func test_When_given_testString_Then_return_Formula_Instance() {
        // given
        let testString = "1+23-4*567/8+9+010"
        let resultOperands: [Double] = [1, 23, 4, 567, 8, 9, 10]
        let resultOperators: [Operator] = [.add, .subtract, .multiply, .divide, .add, .add]
            
        // when
        var result = ExpressionParser.parse(from: testString)
        var operands: [Double?] = []
        var operators: [Operator?] = []
        
        while !result.operands.isEmpty() {
            operands.append(result.operands.dequeue())
        }
        
        while !result.operators.isEmpty() {
            operators.append(result.operators.dequeue())
        }
        
        // then
        XCTAssertEqual(operands, resultOperands)
        XCTAssertEqual(operators, resultOperators)
    }
}

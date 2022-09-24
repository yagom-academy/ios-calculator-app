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
    
    func test_When_given_minus_Number_Then_return_right_Formual() {
        // given
        let testString1 = "-1+-3"
        let resultOperands1: [Double] = [-1, -3]
        let resultOperators1: [Operator] = [.add]
        
        let testString2 = "-1--2--3+-4*-5/-6"
        let resultOperands2: [Double] = [-1, -2, -3, -4, -5, -6]
        let resultOperators2: [Operator] = [.subtract, .subtract, .add, .multiply, .divide]
        
        // when
        var result1 = ExpressionParser.parse(from: testString1)
        var operands1: [Double?] = []
        var operators1: [Operator?] = []
        
        while !result1.operands.isEmpty() {
            operands1.append(result1.operands.dequeue())
        }
        
        while !result1.operators.isEmpty() {
            operators1.append(result1.operators.dequeue())
        }
        
        var result2 = ExpressionParser.parse(from: testString2)
        var operands2: [Double?] = []
        var operators2: [Operator?] = []
        
        while !result2.operands.isEmpty() {
            operands2.append(result2.operands.dequeue())
        }
        
        while !result2.operators.isEmpty() {
            operators2.append(result2.operators.dequeue())
        }
        
        // then
        XCTAssertEqual(operands1, resultOperands1)
        XCTAssertEqual(operators1, resultOperators1)
        
        XCTAssertEqual(operands2, resultOperands2)
        XCTAssertEqual(operators2, resultOperators2)
    }

}

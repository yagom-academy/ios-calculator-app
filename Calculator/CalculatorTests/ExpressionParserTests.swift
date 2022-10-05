//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 이정민 on 2022/09/23.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    
    func test_when_generate_parse_then_expect_Not_nil() {
        // given
        let testString = "1+2+3"
        
        // when
        let result = ExpressionParser.parse(from: testString)
        
        // then
        XCTAssertNotNil(result)
    }
    
    func test_when_given_testString_then_return_Formula_Instance() {
        // given
        let testString = "1+23-4*567/8+9+010"
        let resultOperands: [Double] = [1, 23, 4, 567, 8, 9, 10]
        let resultOperators: [Operator] = [.add, .subtract, .multiply, .divide, .add, .add]
            
        // when
        var result = ExpressionParser.parse(from: testString)
        var operands: [Double?] = []
        var operators: [Operator?] = []
        
        dequeueAllAndPushIn(&operands, &operators, at: &result)
        
        // then
        XCTAssertEqual(operands, resultOperands)
        XCTAssertEqual(operators, resultOperators)
    }
    
    func test_when_given_minus_Number_then_return_right_Formula() {
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
        
        dequeueAllAndPushIn(&operands1, &operators1, at: &result1)
        
        var result2 = ExpressionParser.parse(from: testString2)
        var operands2: [Double?] = []
        var operators2: [Operator?] = []
        
        dequeueAllAndPushIn(&operands2, &operators2, at: &result2)
        
        // then
        XCTAssertEqual(operands1, resultOperands1)
        XCTAssertEqual(operators1, resultOperators1)
        
        XCTAssertEqual(operands2, resultOperands2)
        XCTAssertEqual(operators2, resultOperators2)
    }
    
    func dequeueAllAndPushIn(_ operands: inout [Double?], _ operators: inout [Operator?], at queue: inout Formula) {
        while queue.operands.isEmpty() == false {
            operands.append(queue.operands.dequeue())
        }
        
        while queue.operators.isEmpty() == false {
            operators.append(queue.operators.dequeue())
        }
    }
}

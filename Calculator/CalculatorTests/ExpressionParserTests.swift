//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by Ari on 2021/11/11.
//

import XCTest

class ExpressionParserTests: XCTestCase {

    func test_연산자와숫자가_한개씩() {
        let input = ExpressionParser.parse(from: "12 + !@#")

        XCTAssertTrue(input.operands.count == 1)
        XCTAssertTrue(input.operators.count == 1)
    }
    
    func test_연산자와숫자가_두개씩() {
        let input = ExpressionParser.parse(from: "12 + 12 - !@#$")

        XCTAssertTrue(input.operands.count == 2)
        XCTAssertTrue(input.operators.count == 2)
    }
    
    func test_연산자와숫자가_세개씩() {
        let input = ExpressionParser.parse(from: "12.123 + 12 * 12 + ")
        
        XCTAssertTrue(input.operands.count == 3)
        XCTAssertTrue(input.operators.count == 3)
    }
    
    func test_연산자와숫자가_두개세개() {
        let input = ExpressionParser.parse(from: "12 + 12.123 / 2")
        
        XCTAssertTrue(input.operands.count == 3)
        XCTAssertTrue(input.operators.count == 2)
    }
    
    func test_연산자와숫자가_네개다섯개() {
        let input = ExpressionParser.parse(from: "12 + 12 + -12 - 12.123123123 + 12")
        
        XCTAssertTrue(input.operands.count == 5)
        XCTAssertTrue(input.operators.count == 4)
    }
    
    func test_연산자와숫자가_두개씩_음수포함() {
        var input = ExpressionParser.parse(from: "12 - -12 + !@#$")

        XCTAssertTrue(input.operands.count == 2)
        XCTAssertTrue(input.operators.count == 2)
        XCTAssertEqual(input.operators.dequeue(), .subtract)
    }
}

//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 이호영 on 2021/11/12.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {

    func test_계산식을_넣으면_연산자가_구분되어_반환한다() {
        let String = "15*-1+0.4"
        
        var operators = ExpressionParser.parse(from: String).operators
        
        let firstOperator = operators.dequeue() as? Operator
        XCTAssertEqual(firstOperator?.rawValue, "*")
        
        let secondOperator = operators.dequeue() as? Operator
        XCTAssertEqual(secondOperator?.rawValue, "+")
        
        var operands = ExpressionParser.parse(from: String).operands
        
        XCTAssertEqual(operands.dequeue() as? Double, 15.0)
        XCTAssertEqual(operands.dequeue() as? Double, -1.0)
        XCTAssertEqual(operands.dequeue() as? Double, 0.4)
    }

}

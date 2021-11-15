//
//  OperatorTest.swift
//  CalculatorTests
//
//  Created by Seul Mac on 2021/11/12.
//

import XCTest

class OperatorTest: XCTestCase {
    
    func test_정수_2개_add연산자_계산() {
        let result = Operator.add.calculate(lhs: 4, rhs: 2)
        XCTAssertEqual(result, 6)
    }
    
    func test_정수_2개_subtract연산자_계산() {
        let result = Operator.subtract.calculate(lhs: 4, rhs: 2)
        XCTAssertEqual(result, 2)
    }
    
    func test_정수_2개_divide연산자_계산() {
        let result = Operator.divide.calculate(lhs: 4, rhs: 2)
        XCTAssertEqual(result, 2)
    }
    
    func test_정수_2개_multiply연산자_계산() {
        let result = Operator.multiply.calculate(lhs: 4, rhs: 2)
        XCTAssertEqual(result, 8)
    }
}

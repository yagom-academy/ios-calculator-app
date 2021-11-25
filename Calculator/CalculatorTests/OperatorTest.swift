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
    
    func test_실수_음수_각1개_add연산자_계산() {
        let result = Operator.add.calculate(lhs: 2.5, rhs: -4.5)
        XCTAssertEqual(result, -2)
    }
    
    func test_실수_음수_각1개_subtract연산자_계산() {
        let result = Operator.subtract.calculate(lhs: 2.5, rhs: -4.5)
        XCTAssertEqual(result, 7)
    }
    
    func test_실수_음수_각1개_divide연산자_계산() {
        let result = Operator.divide.calculate(lhs: 2.5, rhs: -5)
        XCTAssertEqual(result, -0.5)
    }
    
    func test_실수_음수_각1개_multiply연산자_계산() {
        let result = Operator.multiply.calculate(lhs: 2.5, rhs: -4.5)
        XCTAssertEqual(result, -11.25)
    }
    
    func test_실수_0_각1개_devide연산자_계산() {
        let result = Operator.divide.calculate(lhs: 2.5, rhs: 0)
        
        XCTAssertTrue(result.isNaN)
    }
}

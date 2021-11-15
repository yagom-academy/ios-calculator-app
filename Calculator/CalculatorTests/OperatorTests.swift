//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by yeha on 2021/11/15.
//

import XCTest

class OperatorTests: XCTestCase {
    func test_rawValue() {
        let operators = Operator.add.rawValue
        XCTAssertEqual(operators, "+")
    }
    
    func test_더하기_연산() {
        let operators = Operator(rawValue: "+")
        let result = operators?.calculate(1.1, 1.1)
        XCTAssertEqual(result, 2.2)
    }
    
    func test_음수_더하기_연산() {
        let operators = Operator(rawValue: "+")
        let result = operators?.calculate(-1.1, -1.1)
        XCTAssertEqual(result, -2.2)
    }
    
    func test_빼기_연산() {
        let operators = Operator(rawValue: "-")
        let result = operators?.calculate(1.1, 1.1)
        XCTAssertEqual(result, 0.0)
    }
    
    func test_음수_빼기_연산() {
        let operators = Operator(rawValue: "-")
        let result = operators?.calculate(1.1, -1.1)
        XCTAssertEqual(result, 2.2)
    }
    
    func test_나누기_연산() {
        let operators = Operator(rawValue: "/")
        let result = operators?.calculate(1.1, 1.1)
        XCTAssertEqual(result, 1.0)
    }
    
    func test_곱하기_연산() {
        let operators = Operator(rawValue: "*")
        let result = operators?.calculate(1.1, 0.0)
        XCTAssertEqual(result, 0.0)
    }
}

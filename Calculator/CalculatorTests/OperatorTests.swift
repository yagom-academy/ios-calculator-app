//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by yeha on 2021/11/15.
//

import XCTest

class OperatorTests: XCTestCase {
    func test_rawValue() {
        let addOperator = Operator.add.rawValue
        XCTAssertEqual(addOperator, "+")
    }

    func test_양수끼리_더하기() {
        let result = Operator.add.calculate(1.1, 1.1)
        XCTAssertEqual(result, 2.2)
    }
    
    func test_양수끼리_빼기() {
        let result = Operator.subtract.calculate(1.1, 1.1)
        XCTAssertEqual(result, 0.0)
    }
    
    func test_양수끼리_곱하기() {
        let result = Operator.multiply.calculate(1.1, 2.2)
        let formattedResult = Double(String(format: "%.2f", result))
        XCTAssertEqual(formattedResult, 2.42)
    }
    
    func test_양수끼리_나누기() {
        let result = Operator.divide.calculate(2.2, 1.1)
        XCTAssertEqual(result, 2.0)
    }
    
    func test_0과_양수를_곱하기() {
        let result = Operator.multiply.calculate(1.1, 0.0)
        XCTAssertEqual(result, 0.0)
    }
    
    func test_양수를_0으로_나누기() {
        let result = Operator.divide.calculate(1.1, 0.0)
        XCTAssertTrue(result.isNaN)
    }
    
    func test_0을_양수로_나누기() {
        let result = Operator.divide.calculate(0.0, 1.1)
        XCTAssertEqual(result, 0.0)
    }
    
    func test_음수를_더하기() {
        let result = Operator.add.calculate(-2.2, 1.1)
        XCTAssertEqual(result, -1.1)
    }

    func test_음수끼리_빼기() {
        let result = Operator.subtract.calculate(-1.1, -1.1)
        XCTAssertEqual(result, 0.0)
    }

    func test_음수를_곱하기() {
        let result = Operator.multiply.calculate(1.1, -2.2)
        let formattedResult = Double(String(format: "%.2f", result))
        XCTAssertEqual(formattedResult, -2.42)
    }

    func test_음수를_나누기() {
        let result = Operator.divide.calculate(-2.2, 1.1)
        XCTAssertEqual(result, -2.0)
    }

    func test_0과_음수를_곱하기() {
        let result = Operator.multiply.calculate(-1.1, 0.0)
        XCTAssertEqual(result, 0.0)
    }

    func test_음수를_0으로_나누기() {
        let result = Operator.divide.calculate(-1.1, 0.0)
        XCTAssertTrue(result.isNaN)
    }

    func test_0을_음수로_나누기() {
        let result = Operator.divide.calculate(0.0, -1.1)
        XCTAssertEqual(result, 0.0)
    }    
}

//
//  OperatorTests.swift
//  CalculatorQueueTests
//
//  Created by 송종환 on 2023/01/31.
//

import XCTest

@testable import Calculator

final class OperatorTests: XCTestCase {
  
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_calculate매서드는_각연산에_대해_lhs_rhs_두_Double값을_인자로받아_연산을_수행한다() {
        let lhsInput = 32.0
        let rhsInput = 4.0
        
        let addExpectedResult = 36.0
        let subtractExpectedResult = 28.0
        let divideExpectedResult = 8.0
        let multiplyExpectedResult = 128.0
        
        let addResult = Operator.add.calculate(lhs: lhsInput, rhs: rhsInput)
        let subtractResult = Operator.subtract.calculate(lhs: lhsInput, rhs: rhsInput)
        let divideResult = Operator.divide.calculate(lhs: lhsInput, rhs: rhsInput)
        let multiplyResult = Operator.multiply.calculate(lhs: lhsInput, rhs: rhsInput)
        
        XCTAssertEqual(addExpectedResult, addResult)
        XCTAssertEqual(subtractExpectedResult, subtractResult)
        XCTAssertEqual(divideExpectedResult, divideResult)
        XCTAssertEqual(multiplyExpectedResult, multiplyResult)
    }

}

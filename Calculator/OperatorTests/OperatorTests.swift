//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Mangdi on 2022/09/23.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_calculate_호출했을때_add로잘리턴하는지() {
        let addValue = Operator.add.calculate(lhs: 20, rhs: 20)
        XCTAssertEqual(40, addValue)
    }
    
    func test_calculate_호출했을때_subtract로잘리턴하는지() {
        let subtractValue = Operator.subtract.calculate(lhs: 50, rhs: 30)
        XCTAssertEqual(20, subtractValue)
    }
    
    func test_calculate_호출했을때_divide로잘리턴하는지() {
        let divideValue = Operator.divide.calculate(lhs: 60, rhs: 30)
        XCTAssertEqual(2, divideValue)
    }
    
    func test_calculate_호출했을때_multiply로잘리턴하는지() {
        let multiplyValue = Operator.multiply.calculate(lhs: 10, rhs: 30)
        XCTAssertEqual(300, multiplyValue)
    }
}

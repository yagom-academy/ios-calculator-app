//
//  OperatorDivideTests.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/12.
//

import XCTest
@testable import Calculator

class OperatorDivideTests: XCTestCase {
    var sut: Operator!
    
    override func setUpWithError() throws {
        sut = Operator.divide
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testCalculate_givenDecimal20andDecimal10_expectDecimal2() {
        XCTAssertEqual(sut.calculate(lhs: 20.0, rhs: 10.0), 2.0)
    }
    
    func testCalculate_given20and3_expectDecimal6Point3() {
        XCTAssertNotEqual(sut.calculate(lhs: 20, rhs: 3), 6.6)
    }
    
    func testCalculate_given10and0_expectNAN() {
        XCTAssertEqual(sut.calculate(lhs: 10, rhs: 0), Double.nan)
    }
}

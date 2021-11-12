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
}

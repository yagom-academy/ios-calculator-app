//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Ellen on 2021/06/30.
//
import XCTest

@testable import Calculator

class CalculatorTests: XCTestCase {
    
    var sut = Postfix()
    var sut2 = Calculator()
    
    func test_덧셈만_입력했을때_결과를_반환한다() {
        let testcase = ["1", "+", "2", "+", "3"]
        sut.separateInfix(from: testcase)
        XCTAssertEqual(try sut2.returnCalculationResult(), Optional("6"))
    }
}

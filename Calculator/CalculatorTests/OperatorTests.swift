//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 김동욱 on 2022/03/19.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    var sut: Operator!

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_add_() {
        sut = .add
        let result = sut.calculate(lhs: 1, rhs: 2)
        XCTAssertEqual(result, 3)
    }
    
    func test_sub_() {
        sut = .subtract
        let result = sut.calculate(lhs: 1, rhs: 1)
        XCTAssertEqual(result, 0)
    }
    
    func test_multiply_() {
        sut = .multiply
        let result = sut.calculate(lhs: 1, rhs: 2)
        XCTAssertEqual(result, 2)
    }
    
    func test_divide_rhs값이_0이아닐때_성공적으로_나누어지는지() {
        sut = .divide
        let result = sut.calculate(lhs: 2, rhs: 1)
        XCTAssertEqual(result, 2)
    }
    
    func test_divide_rhs값이_0일때_결과값이_nan인지() {
        sut = .divide
        let result = sut.calculate(lhs: 2, rhs: 0)
        XCTAssertTrue(result.isNaN)
    }
}

//
//  Operator_calculate_multiply_Tests.swift
//  CalculatorTests
//
//  Created by 1 on 2021/11/15.
//

import XCTest
@testable import Calculator

class Operator_calculate_multiply_Tests: XCTestCase {
    let sut = Operator.multiply
    
    func test_calculate호출시_lhs가_양수이고_rhs도_양수일때_lhs와_rhs의_곱셈값을_반환한다() {
        let lhs = 33.0
        let rhs = 5.0
        XCTAssertEqual(try sut.calculate(lhs: lhs, rhs: rhs), lhs * rhs)
    }
    
    func test_calculate호출시_lhs가_양수이고_rhs도_음수일때_lhs와_rhs의_곱셈값을_반환한다() {
        let lhs = 33.0
        let rhs = -5.0
        XCTAssertEqual(try sut.calculate(lhs: lhs, rhs: rhs), lhs * rhs)
    }
    
    func test_calculate호출시_lhs가_음수이고_rhs도_음수일때_lhs와_rhs의_곱셈값을_반환한다() {
        let lhs = -33.0
        let rhs = -5.0
        XCTAssertEqual(try sut.calculate(lhs: lhs, rhs: rhs), lhs * rhs)
    }
}



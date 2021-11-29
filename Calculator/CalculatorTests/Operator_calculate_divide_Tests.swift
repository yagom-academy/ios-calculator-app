//
//  Operator_calculate_divide_Tests.swift
//  CalculatorTests
//
//  Created by 1 on 2021/11/15.
//

import XCTest
@testable import Calculator

class Operator_calculate_divide_Tests: XCTestCase {
    let sut = Operator.divide
    
    func test_calculate호출시_lhs가_양수이고_rhs도_양수일때_1hs를_2hs로_나눈몫을_반환한다() {
        let lhs = 100.00
        let rhs = 2.0
        XCTAssertEqual(try sut.calculate(lhs: lhs, rhs: rhs), lhs/rhs)
    }
    
    func test_calculate호출시_rhs가_0일때_NaN을_반환한다() {
        let lhs = 12345.6789
        let rhs = 0.0
        XCTAssertTrue(try sut.calculate(lhs: lhs, rhs: rhs).isNaN)
    }
    
    func test_calculate호출시_lhs가_음수이고_rhs는_양수일때_1hs를_2hs로_나눈몫을_반환한다() {
        let lhs = -100.0
        let rhs = 2.0
        XCTAssertEqual(try sut.calculate(lhs: lhs, rhs: rhs), lhs/rhs)
    }
    
    func test_calculate호출시_lhs와_rhs가_음수일때_1hs를_2hs로_나눈몫을_반환한다() {
        let lhs = -100.0
        let rhs = -2.0
        XCTAssertEqual(try sut.calculate(lhs: lhs, rhs: rhs), lhs/rhs)
    }
    
}

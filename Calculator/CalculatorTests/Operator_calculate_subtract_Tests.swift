//
//  Operator_calculate_subtract_Tests.swift
//  CalculatorTests
//
//  Created by 1 on 2021/11/15.
//

import XCTest
@testable import Calculator

class Operator_calculate_subtract_Tests: XCTestCase {
    let sut = Operator.subtract
    
    func test_calculate호출시_lhs가_양수이고_rhs도_양수일때_lhs_빼기_rhs를_반환한다() {
        let lhs = 30.0
        let rhs = 10.0
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(result, lhs - rhs)
    }
    
    func test_calculate호출시_lhs가_양수이고_rhs는_음수일때_lhs와_빼기_rhs를_반환한다() {
        let lhs = 5000.0
        let rhs = -555.5
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(result, lhs - rhs)
    }
}

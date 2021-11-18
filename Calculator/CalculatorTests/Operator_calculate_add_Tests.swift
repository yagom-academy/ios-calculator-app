//
//  Operator_calculate_addTests.swift
//  CalculatorTests
//
//  Created by 1 on 2021/11/14.
//

import XCTest
@testable import Calculator

class Operator_calculate_add_Tests: XCTestCase {
    let sut = Operator.add

    func test_calculate호출시_lhs와_rhs의_합을_반환한다() {
        let lhs = 11.00
        let rhs = 9.99
        let sum = sut.calculate(lhs: lhs , rhs: rhs)
        
        XCTAssertEqual(sum, lhs + rhs)
    }
}

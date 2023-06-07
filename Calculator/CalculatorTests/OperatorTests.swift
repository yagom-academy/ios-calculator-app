//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by 비모 on 2023/06/07.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    func test_divide_1을_0으로_나누면_divisionError를_잡는다() {
        // given
        let `operator` = Operator.divide
        
        // when
        XCTAssertThrowsError(try `operator`.calculate(lhs: 1, rhs: 0)) { error in
            // then
            XCTAssertEqual(error as? CalculatorError, CalculatorError.divisionError)
        }
    }
    
    func test_divide_0을_0으로_나누면_divisionError를_잡는다() {
        // given
        let `operator` = Operator.divide
        
        // when
        XCTAssertThrowsError(try `operator`.calculate(lhs: 0, rhs: 0)) { error in
            // then
            XCTAssertEqual(error as? CalculatorError, CalculatorError.divisionError)
        }
    }
}

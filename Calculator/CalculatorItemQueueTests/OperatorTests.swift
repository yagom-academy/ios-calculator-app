//
//  OperatorTests.swift
//  Created by 미니.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {

    func test_3더하기_9는_12인가() {
        // given
        let three: Double = 3
        let nine: Double = 9
        let add = Operator.add

        // when
        let result = add.calculate(lhs: three, rhs: nine)

        // then
        XCTAssertEqual(result, 12)
    }
    
    func test_3빼기_9는_마이너스6인가() {
        // given
        let three: Double = 3
        let nine: Double = 9
        let subtract = Operator.subtract

        // when
        let result = subtract.calculate(lhs: three, rhs: nine)

        // then
        XCTAssertEqual(result, -6)
    }
    
    func test_3곱하기_9는_27인가() {
        // given
        let three: Double = 3
        let nine: Double = 9
        let multiply = Operator.multiply

        // when
        let result = multiply.calculate(lhs: three, rhs: nine)

        // then
        XCTAssertEqual(result, 27)
    }
    
    func test_9나누기_3은_3인가() {
        // given
        let nine: Double = 9
        let three: Double = 3
        let divide = Operator.divide

        // when
        let result = divide.calculate(lhs: nine, rhs: three)

        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_3나누기_0은_nan인가() {
        // given
        let three: Double = 3
        let zero: Double = 0
        let divide = Operator.divide

        // when
        let result = divide.calculate(lhs: three, rhs: zero)

        // then
        XCTAssertTrue(result.isNaN)
    }
}

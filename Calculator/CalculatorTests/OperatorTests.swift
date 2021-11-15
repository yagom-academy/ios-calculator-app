//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by 예거 on 2021/11/15.
//

import XCTest

class OperatorTests: XCTestCase {

    func test_add_케이스에서_calculate메서드_계산_확인() {
        let result = Operator.add.calculate(20.5, -10.5)
        let expectation: Double = 10
        XCTAssertEqual(result, expectation)
    }

    func test_subtract_케이스에서_calculate메서드_계산_확인() {
        let result = Operator.subtract.calculate(15.5, -0.5)
        let expectation: Double = 16
        XCTAssertEqual(result, expectation)
    }

    func test_multiply_케이스에서_calculate메서드_계산_확인() {
        let result = Operator.multiply.calculate(3, -3)
        let expectation: Double = -9
        XCTAssertEqual(result, expectation)
    }

    func test_divide_케이스에서_calculate메서드_계산_확인() {
        let result = Operator.divide.calculate(1.5, 0.5)
        let expectation: Double = 3
        XCTAssertEqual(result, expectation)
    }

    func test_divide_케이스에서_0으로_나누면_Double타입의_NaN_반환() {
        let result = Operator.divide.calculate(5, 0)
        XCTAssertTrue(result.isNaN)
    }
}

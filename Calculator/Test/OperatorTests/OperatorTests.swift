//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by kaki on 2023/01/27.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    func test_2개의_숫자가_주어졌을때_add_case일_경우_값을_더해준다() {
        // given
        let lhs = 1.0
        let rhs = 3.0
        // when
        let result = Operator.add.calculate(lhs: lhs, rhs: rhs)
        let expectation = 4.0
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_2개의_숫자가_주어졌을때_subtract_case일_경우_값을_빼준다() {
        // given
        let lhs = 1.0
        let rhs = 3.0
        // when
        let result = Operator.subtract.calculate(lhs: lhs, rhs: rhs)
        let expectation = -2.0
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_2개의_숫자가_주어졌을때_divide_case일_경우_값을_나눠준다() {
        // given
        let lhs = 4.0
        let rhs = 2.0
        // when
        let result = Operator.divide.calculate(lhs: lhs, rhs: rhs)
        let expectation = 2.0
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_rhs에_0이_주어졌을때_divide_case일_경우_nan을_리턴해준다() {
        // given
        let lhs = 3.0
        let rhs = 0.0
        // when
        let result = Operator.divide.calculate(lhs: lhs, rhs: rhs).isNaN
        let expectation = true
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_2개의_숫자가_주어졌을때_multiply_case일_경우_값을_곱해준다() {
        // given
        let lhs = 3.0
        let rhs = 2.0
        // when
        let result = Operator.multiply.calculate(lhs: lhs, rhs: rhs)
        let expectation = 6.0
        // then
        XCTAssertEqual(result, expectation)
    }
}

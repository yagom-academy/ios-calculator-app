//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by 이시원 on 2022/03/18.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    var sut: Operator!

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_더하기_연산이_잘_이루어지는지() {
        // given
        sut = .add
        let first = 1.1
        let second = 1.2

        // when
        let result = try? sut.calculate(lhs: first, rhs: second)
        // then
        XCTAssertEqual(result, first + second)
        
    }
    
    func test_빼기_연산이_잘_이루어지는지() {
        // given
        sut = .subtract
        let first = 1.1
        let second = 1.2

        // when
        let result = try? sut.calculate(lhs: first, rhs: second)
        // then
        XCTAssertEqual(result, first - second)
    }
    
    func test_나누기_연산이_잘_이루어지는지() {
        // given
        sut = .divide
        let first = 1.1
        let second = 1.2

        // when
        let result = try? sut.calculate(lhs: first, rhs: second)
        // then
        XCTAssertEqual(result, first / second)
    }
    
    func test_곱하기_연산이_잘_이루어지는지() {
        // given
        sut = .multiply
        let first = 1.1
        let second = 1.2

        // when
        let result = try? sut.calculate(lhs: first, rhs: second)
        // then
        XCTAssertEqual(result, first * second)
    }
    
    func test_0으로_나눴을때_dividedByZero오류를_던지는지() {
        // given
        sut = .divide
        let first = 1.1
        let second = 0.0
        
        // then
        XCTAssertThrowsError(try sut.calculate(lhs: first, rhs: second)) { error in
            XCTAssertEqual(error as? CalauletorError, CalauletorError.dividedByZero)
        }
    }
}

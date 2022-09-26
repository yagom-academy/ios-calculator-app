//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Hamo on 2022/09/26.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    var sut: Operator!

    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    func testCalculate_Double타입의값2개가_calculator메서드의_인자로들어갔을때_두값의합이반환되어야한다() {
        // given
        sut = Operator.add
        let lhs = 1.0
        let rhs = 2.0
        // when
        let result = try? sut.calculate(lhs: lhs, rhs: rhs)
        // then
        XCTAssertEqual(result, 3.0)
    }
    
    func testCalculate_Double타입의값2개가_calculator메서드의_인자로들어갔을때_lhs빼기rhs가반환되어야한다() {
        // given
        sut = Operator.subtract
        let lhs = 2.0
        let rhs =  1.0
        // when
        let result = try? sut.calculate(lhs: lhs, rhs: rhs)
        // then
        XCTAssertEqual(result, 1.0)
    }
    
    func testCalculate_Double타입의값2개가_calculator메서드의_인자로들어갔을때_lhs나누기rhs한값이반환되어야한다() {
        // given
        sut = Operator.divide
        let lhs = 2.0
        let rhs =  1.0
        // when
        let result = try? sut.calculate(lhs: lhs, rhs: rhs)
        // then
        XCTAssertEqual(result, 2.0)
    }
    
    func testCalculate_Double타입의값2개가_calculator메서드의_인자로들어갔을때_두값의곱이반환되어야한다() {
        // given
        sut = Operator.multiply
        let lhs = 2.0
        let rhs =  1.0
        // when
        let result = try? sut.calculate(lhs: lhs, rhs: rhs)
        // then
        XCTAssertEqual(result, 2.0)
    }
    
    func testCalculate_0으로나누기를시도했을때오류가나야한다() {
        // given
        sut = Operator.divide
        let lhs = 2.0
        let rhs =  0.0
        
        XCTAssertThrowsError(try sut.calculate(lhs: lhs, rhs: rhs)) { error in
            XCTAssertEqual(error as? OperatorError, OperatorError.divideWithZero)
        }
    }
}

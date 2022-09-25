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
    
    func testOperator_Double타입의값2개가_calculator메서드의_인자로들어갔을때_두값의합이반환되어야한다() {
        // given
        sut = Operator.add
        let lhs = 1.0
        let rhs = 2.0
        // when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        // then
        XCTAssertEqual(result, 3.0)
    }
    
    func testOperator_Double타입의값2개가_calculator메서드의_인자로들어갔을때_두값의차가반환되어야한다() {
        // given
        sut = Operator.add
        let lhs = 2.0
        let rhs = 1.0
        // when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        // then
        XCTAssertEqual(result, 1.0)
    }
}

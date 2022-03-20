//
//  FormulaTests.swift
//  Tests
//
//  Created by mmim.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_add() {
        // given
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        // when
        sut.operators.enqueue(.add)
        let result = sut.result()
        // then
        XCTAssertEqual(result, 3.0)
    }
    
    func test_subtract() {
        // given
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(1.0)
        // when
        sut.operators.enqueue(.subtract)
        let result = sut.result()
        // then
        XCTAssertEqual(result, 1.0)
    }
    
    func test_divide() {
        // given
        sut.operands.enqueue(4.0)
        sut.operands.enqueue(2.0)
        // when
        sut.operators.enqueue(.divide)
        let result = sut.result()
        // then
        XCTAssertEqual(result, 2.0)
    }
    
    func test_multiply() {
        // given
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(3.0)
        // when
        sut.operators.enqueue(.multiply)
        let result = sut.result()
        // then
        XCTAssertEqual(result, 6.0)
    }
}

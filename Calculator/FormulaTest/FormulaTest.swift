//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by 강민수 on 2023/01/27.
//

import XCTest
@testable import Calculator

final class FormulaTest: XCTestCase {
    
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func test_1과_2를_더하면_result의_값은_3이다() {
        // given
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(.add)
        let exception = 3.0
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_2와_1을_빼면_result의_값은_1이다() {
        // given
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(1.0)
        sut.operators.enqueue(.subtract)
        let exception = 1.0
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_1과_2를_빼면_result의_값은_음수1이다() {
        // given
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(.subtract)
        let exception = -1.0
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_1과_2를_곱하면_result의_값은_2이다() {
        // given
        sut.operands.enqueue(1.0)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(.multiply)
        let exception = 2.0
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_0과_2를_곱하면_result의_값은_0이다() {
        // given
        sut.operands.enqueue(0.0)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(.multiply)
        let exception = 0.0
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_2와_1을_나누면_result의_값은_2이다() {
        // given
        sut.operands.enqueue(2.0)
        sut.operands.enqueue(1.0)
        sut.operators.enqueue(.divide)
        let exception = 2.0
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, exception)
    }
    
    func test_7과_2를_나누면_result의_값은_3점5이다() {
        // given
        sut.operands.enqueue(7.0)
        sut.operands.enqueue(2.0)
        sut.operators.enqueue(.divide)
        let exception = 3.5
        // when
        let result = sut.result()
        // then
        XCTAssertEqual(result, exception)
    }

}

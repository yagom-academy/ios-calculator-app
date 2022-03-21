//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by marisol on 2022/03/19.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_3가지숫자의합을_Double타입으로리턴한다() {
        // given
        let input = "1 + 2 + 3"
        // when
        var formula = ExpressionParser.parse(from: input)
        // then
        XCTAssertEqual(try formula.result(), 6.0)
        XCTAssertNoThrow(try formula.result(), "error 발생")
    }
    
    func test_곱하기연산자가뒤에있을때에도_앞에서부터차례대로계산한다() {
        // given
        let input = "1 + 2 * 3"
        // when
        var formula = ExpressionParser.parse(from: input)
        // then
        XCTAssertEqual(try formula.result(), 9.0)
        XCTAssertNoThrow(try formula.result(), "error 발생")
    }
    
    func test_소숫점연산결과를_Double타입으로리턴한다() {
        // given
        let input = "4 + 2 / 4"
        // when
        var formula = ExpressionParser.parse(from: input)
        // then
        XCTAssertEqual(try formula.result(), 1.5)
        XCTAssertNoThrow(try formula.result(), "error 발생")
    }
    
    func test_숫자에붙어있는부호를_연산자가아니라_숫자의부호로인식해서계산한다() {
        // given
        let input = "4 + -2 + 3"
        // when
        var formula = ExpressionParser.parse(from: input)
        // then
        XCTAssertEqual(try formula.result(), 5)
        XCTAssertNoThrow(try formula.result(), "error 발생")
    }
    
    func test_0으로나누기를시도했을때_error를throw한다() {
        // given
        let input = "2 / 0"
        // when
        var formula = ExpressionParser.parse(from: input)
        // then
        XCTAssertThrowsError(try formula.result())
    }
}

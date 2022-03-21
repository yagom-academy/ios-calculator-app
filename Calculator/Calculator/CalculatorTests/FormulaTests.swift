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
    
    func test_3가지숫자의합을_Double타입으로리턴한다() throws {
        // given
        let input = "1 + 2 + 3"
        var formula = ExpressionParser.parse(from: input)
        // when
        let result = try formula.result()
        // then
        XCTAssertEqual(result, 6.0)
    }
    
    func test_곱하기연산자가뒤에있을때에도_앞에서부터차례대로계산한다() throws {
        // given
        let input = "1 + 2 * 3"
        var formula = ExpressionParser.parse(from: input)
        // when
        let result = try formula.result()
        // then
        XCTAssertEqual(result, 9.0)
    }
    
    func test_소숫점연산결과를_Double타입으로리턴한다() throws {
        // given
        let input = "4 + 2 / 4"
        var formula = ExpressionParser.parse(from: input)
        // when
        let result = try formula.result()
        // then
        XCTAssertEqual(result, 1.5)
    }
    
    func test_4더하기마이너스2더하기3은_5를리턴한다() throws {
        // given
        let input = "4 + -2 + 3"
        var formula = ExpressionParser.parse(from: input)
        // when
        let result = try formula.result()
        // then
        XCTAssertEqual(result, 5)
    }
    
    func test_0으로나누기를시도했을때_error를throw한다() throws {
        // given
        let input = "2 / 0"
        var formula = ExpressionParser.parse(from: input)
        // when
        // then
        XCTAssertThrowsError(try formula.result())
    }
}

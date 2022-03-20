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
    
    func test_1더하기2더하기3은_6을리턴한다() throws {
        // given
        let input = "1 + 2 + 3"
        var formula = ExpressionParser.parse(from: input)
        // when
        let result = try formula.result()
        // then
        XCTAssertEqual(result, 6.0)
    }
    
    func test_1더하기2곱하기3은_9를리턴한다() throws {
        // given
        let input = "1 + 2 * 3"
        var formula = ExpressionParser.parse(from: input)
        // when
        let result = try formula.result()
        // then
        XCTAssertEqual(result, 9.0)
    }
    
    func test_4더하기2나누기3은_1콤마5를리턴한다() throws {
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
}

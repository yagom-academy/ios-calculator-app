//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by Kay on 2022/05/24.
//

import XCTest
@testable import Calculator

class FormulaTest: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_ResultReturnsEqualWhenItHasProperEquation() throws {
        // given
        let equation = "1000+200-300*4/5"
        // when
        var equationTest = ExpressionParser.parse(from: equation)
        // then
        XCTAssertEqual(try equationTest.result(), 720.0)
    }
    
    func test_ResultThrowsErrorWhenItHasNotProperEquation() throws {
        // given
        let equation = "1000+200-300*4/5+"
        // when
        var equationTest = ExpressionParser.parse(from: equation)
        // then
        XCTAssertThrowsError(try equationTest.result())
    }
    
    func test_ResultThrowsErrorWhenItHasDivideByZeroEquation() throws {
        // given
        let equation = "1000+200-300*4/0+"
        // when
        var equationTest = ExpressionParser.parse(from: equation)
        // then
        XCTAssertThrowsError(try equationTest.result())
    }
}

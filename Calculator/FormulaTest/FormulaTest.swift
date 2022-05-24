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

    func test_resultReturnsEqualWhenItHasProperEquation() throws {
        // given
        let equation = "1000+200-300*4/5"
        // when
        var formula1 = ExpressionParser.parse(from: equation)
        // then
        XCTAssertEqual(try formula1.result(), 720.0)
    }
    
    func test_resultThrowsErrorWhenItHasNotProperEquation() throws {
        // given
        let equation = "1000+200-300*4/5+"
        // when
        var formula1 = ExpressionParser.parse(from: equation)
        // then
        XCTAssertThrowsError(try formula1.result())
    }
}

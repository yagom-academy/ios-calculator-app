//
//  ExpressionParserTest.swift
//  ExpressionParserTest
//
//  Created by Kay on 2022/05/26.
//

import XCTest
@testable import Calculator

class ExpressionParserTest: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_returnsTrueWhenBothCountsOfOperandsAndOperatorsMatchesWithWhatEquationActuallyHas() throws {
        // given
        let equation = "1000+200-300*4/5"
        let expectedOperandsCount = 5
        let expectedOperatorCount = 4
        
        // when
        let parseTest = ExpressionParser.parse(from: equation)
        let operandsCount = parseTest.operands.count
        let operatorCount = parseTest.operators.count
        
        //then
        XCTAssertEqual(operandsCount, expectedOperandsCount)
        XCTAssertEqual(operatorCount, expectedOperatorCount)
    }
}

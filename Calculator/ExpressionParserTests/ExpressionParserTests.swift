//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Gordon Choi on 2022/05/24.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_parse메서드에_1더하기2빼기3을_넣었을때_알맞은Formula_반환() {
        // given
        let input = "1+2–3"
        
        // when
        let formula = ExpressionParser.parse(from: input)
        let formulaValue = try? formula.result()
        
        let expected = Formula(operands: CalculatorItemQueue(array: [1, 2, 3]),
                               operators: CalculatorItemQueue(array: [Operator.add, Operator.subtract]))
        let expectedValue = try? expected.result()
        
        // then
        XCTAssertEqual(formulaValue, expectedValue)
    }
}

//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by NAMU on 2022/05/19.
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
    
    //MARK: - parse test
    func test_parse_string변환해서_정상적으로_Formula를반환하는지() {
        // given
        let formula = ExpressionParser.parse(from: "123 - 123 + -123")
        
        // when
        let resultOperand = Int(formula.operands.peek()!)
        let resultOperator = formula.operators.peek()
        
        // then
        XCTAssertEqual(resultOperand, 123)
        XCTAssertEqual(resultOperator, .subtract)
    }
    
    func test_parse_string변환해서_정상적으로_연산값을_반환하는지() throws {
        // given
        var formula = ExpressionParser.parse(from: "12 ÷ 130 - 3")
        
        // when
        let result = 12.0 / 130.0 - 3.0
        // then
        XCTAssertEqual(result, try formula.result())
    }
    
    func test_parse_string변환해서_비정상입력에서_에러를_반환하는지() {
        // given
        var formula = ExpressionParser.parse(from: "123 × 123 ×")
        
        // then
        XCTAssertThrowsError(try formula.result())
    }
    
    func test_parse_숫자하나의_연산값을_반환하는지() {
        // given
        var formula = ExpressionParser.parse(from: "123")
        
        // when
        let result = 123.0
        
        // then
        XCTAssertEqual(result, try formula.result())
    }
}

//
//  ExpressionParserTeste.swift
//  CalculatorTests
//
//  Created by redmango1446 on 2023/06/07.
//

import XCTest
@testable import Calculator

final class ExpressionParserTeste: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test1_parse_1_더하기_10을_넣고_operands를_dequeue를_하면_1을_반환한다() {
        // given
        let input = "1 + 10"
        
        // when
        var formula = ExpressionParser.parse(from: input)
        let result = formula.operands.dequeue()
        let expectedValue: Double = 1
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test2_parse_1_더하기_10을_넣고_operands를_dequeue를_2번_하면_10을_반환한다() {
        // given
        let input = "1 + 10"
        
        // when
        var formula = ExpressionParser.parse(from: input)
        var result = formula.operands.dequeue()
            result = formula.operands.dequeue()
        let expectedValue: Double = 10
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test3_parse_1_더하기_10을_넣고_operatos를_dequeue하면_더하기를_반환한다() {
        // given
        let input = "1 + 10"
        
        // when
        var formula = ExpressionParser.parse(from: input)
        let result = formula.operators.dequeue()
        let expectedValue = Operator.add
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test4_parse_1_더하기_10_빼기_1을_넣고_operatos를_2번_dequeue하면_빼기를_반환한다() {
        // given
        let input = "1 + 10 - 1"
        
        // when
        var formula = ExpressionParser.parse(from: input)
        var result = formula.operators.dequeue()
            result = formula.operators.dequeue()
        let expectedValue = Operator.subtract
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
}

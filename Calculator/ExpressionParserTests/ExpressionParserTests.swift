//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by jybong on 10/10/23.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_parse호출시_빈String을넣었을때_빈Fomula를반환한다() {
        // given
        let input = ""
        
        // when
        let result = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertTrue(result.operands.isEmpty)
        XCTAssertTrue(result.operators.isEmpty)
    }
    
    func test_parse호출시_double1개인String을넣었을때_operandsfornt에해당값이있다() {
        // given
        let input = "10.2"
        let formula = ExpressionParser.parse(from: input)
        let expectation = Double(input)
        
        // when
        let result = formula.operands.front
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse호출시_operator가1개인String을넣었을때_operatorsfornt에해당값이있다() {
        // given
        let input = "−"
        let formula = ExpressionParser.parse(from: input)
        let expectation = Operator(rawValue: Character(input))
        
        // when
        let result = formula.operators.front
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse호출시_double과operator1개씩있는String을넣었을때_operand에만해당값이있다() {
        // given
        let input = "1.1+"
        let formula = ExpressionParser.parse(from: input)
        let expectatedOperands = 1.1
        
        // when
        let operandsResult = formula.operands.front
        let operatorsResult = formula.operators.front
        
        // then
        XCTAssertNil(operatorsResult)
        XCTAssertEqual(operandsResult, expectatedOperands)
    }
    
    func test_parse호출시_double이3개_operator가2개있는String을넣었을때_값이3개2개씩있는Fomula를반환한다() {
        // given
        let input = "1.0 + 2.5 / 3.2"
        let expectatedOperandsCount = 3
        let expectatedOperatorsCount = 2
        
        // when
        let result = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(result.operands.count, expectatedOperandsCount)
        XCTAssertEqual(result.operators.count, expectatedOperatorsCount)
    }
    
    func test_parse호출시_음수인double포함2개_operator가1개인String을넣었을때_값이2개1개씩있는Fomula를반환한다() {
        // given
        let input = "1.1 * -2.2"
        let expectatedOperandsCount = 2
        let expectatedOperatorsCount = 1
        
        // when
        let result = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(result.operands.count, expectatedOperandsCount)
        XCTAssertEqual(result.operators.count, expectatedOperatorsCount)
    }
}

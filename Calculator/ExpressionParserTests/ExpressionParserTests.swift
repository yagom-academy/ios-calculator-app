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
    
    func test_parse호출시_양수인doubleString1개를넣었을때_operandsfornt에해당값이있다() {
        // given
        let input = "10.2"
        let formula = ExpressionParser.parse(from: input)
        let expectation = Double(input)
        
        // when
        let result = formula.operands.peek
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse호출시_음수인doubleString1개를넣었을때_operandsfornt에해당값이있다() {
        // given
        let input = "-10.2"
        let formula = ExpressionParser.parse(from: input)
        let expectation = Double(input)
        
        // when
        let result = formula.operands.peek
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse호출시_operator가1개인String을넣었을때_operatorsfornt에해당값이있다() {
        // given
        let input = "−"
        let formula = ExpressionParser.parse(from: input)
        let expectation = Operator(rawValue: Character(input))
        
        // when
        let result = formula.operators.peek
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse호출시_double과operator1개씩있는String을넣었을때_operand에만해당값이있다() {
        // given
        let input = "1.1+"
        let formula = ExpressionParser.parse(from: input)
        let expectatedOperands = 1.1
        let expectatedOperators = Operator.add
        
        // when
        let operandsResult = formula.operands.peek
        let operatorsResult = formula.operators.peek
        
        // then
        XCTAssertEqual(operatorsResult, expectatedOperators)
        XCTAssertEqual(operandsResult, expectatedOperands)
    }
    
    func test_parse호출시_double이3개_operator가2개있는String을넣었을때_각각의값이있는Fomula를반환한다() {
        // given
        let input = "1.0+2.5−3.2"
        let formula = ExpressionParser.parse(from: input)
        let expectatedOperandsfront = 1.0
        let expectatedOperandsRear = 3.2
        let expectatedOperatorsfront = Operator.add
        let expectatedOperatorsRear = Operator.subtract
        
        // when
        let operandsResult = formula.operands
        let operatorsResult = formula.operators
        
        // then
        XCTAssertEqual(operandsResult.peek, expectatedOperandsfront)
        XCTAssertEqual(operatorsResult.peek, expectatedOperatorsfront)
    }
    
    func test_parse호출시_음수인double포함2개_operator가1개인String을넣었을때_각각의값이있는Fomula를반환한다() {
        // given
        let input = "1.1×-2.2"
        let formula = ExpressionParser.parse(from: input)
        let expectatedOperandsfront = 1.1
        let expectatedOperandsRear = -2.2
        let expectatedOperatorsfront = Operator.multiply
        
        // when
        let operandsResult = formula.operands
        let operatorsResult = formula.operators
        
        // then
        XCTAssertEqual(operandsResult.peek, expectatedOperandsfront)
        XCTAssertEqual(operatorsResult.peek, expectatedOperatorsfront)
    }
}

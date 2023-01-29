//
//  ExpressionParserTest.swift
//  ExpressionParserTest
//
//  Created by 천승현 on 2023/01/27.
//

import XCTest

final class ExpressionParserTest: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_componentnsByOperators호출시_3_더하기_5_곱하기_2_빼기_10을_인자로받으면_문자열배열3_5_2_10_을반환한다() {
        // given
        let input = "3+5*2-10"
        let expectation = ["3", "5", "2", "10"]
        
        // when
        let result = ExpressionParser.componentnsByOperators(from: input)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_componentnsByOperators호출시_3_빼기_음수3_곱하기_4_곱하기_2는_문자열배열3_음수3_4_2를반환한다() {
        // given
        let input = "3-⎼3*4*2"
        let expectation = ["3", "⎼3", "4", "2"]
        
        // when
        let result = ExpressionParser.componentnsByOperators(from: input)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse호출시_3_곱하기_5_나누기_9_빼기_2를_인자로넣으면_operands에는3_5_9_2가들어가고_operators에는곱하기_나누기_빼기가_들어간다() {
        // given
        let input = "3*5/9-2"
        let operandsExpectation = [3.0, 5.0, 9.0, 2.0]
        let operatorsExpectation = [Operator.multiply, Operator.divide, Operator.subtract]

        // when
        let formula = ExpressionParser.parse(from: input)
        let operandsResult = formula.operands.enqueueStack
        let operatorResult = formula.operators.enqueueStack
        
        XCTAssertEqual(operandsResult, operandsExpectation)
        XCTAssertEqual(operatorResult, operatorsExpectation)
    }
    
    func test_parse호출시_3_빼기_음수32_플러스_5_곱하기_9를_인자로넣으면_operands에는3_음수32_5_9가들어가고_operators에는빼기_더하기_곱하기가_들어간다() {
        // given
        let input = "3-⎼32+5*9"
        let operandsExpectation = [3.0, -32.0, 5.0, 9.0]
        let operatorsExpectation = [Operator.subtract, Operator.add, Operator.multiply]

        // when
        let formula = ExpressionParser.parse(from: input)
        let operandsResult = formula.operands.enqueueStack
        let operatorResult = formula.operators.enqueueStack
        
        XCTAssertEqual(operandsResult, operandsExpectation)
        XCTAssertEqual(operatorResult, operatorsExpectation)
    }
    
}

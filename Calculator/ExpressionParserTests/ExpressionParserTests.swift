//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Jinah Park on 2023/01/29.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    
    func test_input이1더하기2빼기3곱하기4나누기5일때_parse호출시_1과2와3과4와5가들어있는배열과더하기빼기곱하기나누기가들어있는배열의큐를반환한다() {
        //given
        let input = "1+2-3*4/5"
        let expectedOperands = [1.0, 2.0, 3.0, 4.0, 5.0]
        let expectedOperator = [Operator.add, Operator.subtract, Operator.multiply, Operator.divide]
        //when
        let result = ExpressionParser.parse(from: input)
        //then
        XCTAssertEqual(expectedOperands, result.operands.data)
        XCTAssertEqual(expectedOperator, result.operators.data)
    }
    
    func test_input이1더하기2더하기3일때_parse호출시_1과2와3이들어있는배열과더하기와더하기가들어있는배열의큐를반환한다() {
        //given
        let input = "1+2+3"
        let expectedOperands = [1.0, 2.0, 3.0]
        let expectedOperator = [Operator.add, Operator.add]
        //when
        let result = ExpressionParser.parse(from: input)
        //then
        XCTAssertEqual(expectedOperands, result.operands.data)
        XCTAssertEqual(expectedOperator, result.operators.data)
    }
    
    func test_input이1점1더하기2점2빼기3점3곱하기4점4나누기5점5일때_parse호출시_1점1과2점2와3점3과4점4와5점5가들어있는배열과더하기빼기곱하기나누기가들어있는배열의큐를반환한다() {
        //given
        let input = "1.1+2.2-3.3*4.4/5.5"
        let expectedOperands = [1.1, 2.2, 3.3, 4.4, 5.5]
        let expectedOperator = [Operator.add, Operator.subtract, Operator.multiply, Operator.divide]
        //when
        let result = ExpressionParser.parse(from: input)
        //then
        XCTAssertEqual(expectedOperands, result.operands.data)
        XCTAssertEqual(expectedOperator, result.operators.data)
    }
    
    func test_input이1점1더하기2점2더하기3점3일때_parse호출시_1점1과2점2와3점3이들어있는배열과더하기와더하기가들어있는배열의큐를반환한다() {
        //given
        let input = "1.1+2.2+3.3"
        let expectedOperands = [1.1, 2.2, 3.3]
        let expectedOperator = [Operator.add, Operator.add]
        //when
        let result = ExpressionParser.parse(from: input)
        //then
        XCTAssertEqual(expectedOperands, result.operands.data)
        XCTAssertEqual(expectedOperator, result.operators.data)
    }
}

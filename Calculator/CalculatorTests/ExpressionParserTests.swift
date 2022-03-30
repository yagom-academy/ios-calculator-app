//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by Lingo on 2022/03/18.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
  
  func test_parse_주어진_입력후_호출시_formula_operands_elements는_1_2_음수1의_배열을_반환해야한다() {
    // given
    let input = "1 + 2 × -1"
    // when
    var formula = ExpressionParser.parse(from: input)
    var output = [Double?]()
    output.append(formula.operands.dequeue())
    output.append(formula.operands.dequeue())
    output.append(formula.operands.dequeue())
    // then
    XCTAssertEqual(output, [1.0, 2.0, -1.0])
  }
  
  func test_parse_주어진_입력후_호출시_formula_operators_elements는_add_multiply의_배열을_반환해야한다() {
    // given
    let input = "1 + 2 × -1"
    // when
    var formula = ExpressionParser.parse(from: input)
    var output = [Operator?]()
    output.append(formula.operators.dequeue())
    output.append(formula.operators.dequeue())
    // then
    XCTAssertEqual(output, [.add, .multiply])
  }
  
  func test_parse_주어진_입력후_호출시_formula의_result는_음수3을_반환해야한다() {
    // given
    let input = "1 + 2 × -1"
    // when
    var expressionParser = ExpressionParser.parse(from: input)
    // then
    XCTAssertEqual(try expressionParser.result(), -3.0)
  }
  
  func test_parse_미완성된_사용자_입력후_호출시_formula의_result는_Error를_던져야한다() {
    // given
    let input = "1 + 2 − "
    // when
    var expressionParser = ExpressionParser.parse(from: input)
    // then
    XCTAssertThrowsError(try expressionParser.result())
  }
  
  func test_parse_계산한_결과값이_6이_나와야한다() {
    // given when
    let someInput = "1 + 2 − -3 "
    var expressionParser = ExpressionParser.parse(from: someInput)
    // then
    XCTAssertEqual(try expressionParser.result(), 6.0)
  }
  
  func test_parse_계산했을때_연산자로_끝나는_경우_에러를_던저야한다() {
    // given when
    let someInput = "1 + 2 − -3 + "
    var expressionParser = ExpressionParser.parse(from: someInput)
    // then
    XCTAssertThrowsError(try expressionParser.result())
  }
  
  func test_parse_계산했을때_0으로_나누는_경우_NaN를_반환해야한다() {
    // given when
    let someInput = "1 + 2 ÷ 0 "
    var expressionParser = ExpressionParser.parse(from: someInput)
    // then
    XCTAssertTrue(try expressionParser.result().isNaN)
  }
  
  func test_parse_빈_문자를_입력후_계산했을때_에러를_던져야한다() {
    // given when
    let someInput = ""
    var expressionParser = ExpressionParser.parse(from: someInput)
    // then
    XCTAssertThrowsError(try expressionParser.result())
  }
}

//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 예거 on 2021/11/16.
//

import XCTest

class ExpressionParserTests: XCTestCase {
    
    func test_parse메서드_String에서_연산자_필터링_기능_확인() {
        let input = "123.3 × -12.233 ÷ 10 + -152.25 - -0.1"
        let result = ExpressionParser.parse(from: input).operators.queue
        let expectation: [Operator] = [.multiply, .divide, .add, .subtract]
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse메서드_String에서_숫자_필터링_기능_확인() {
        let input = "123.3 × -12.233 ÷ 10 + -152.25 - -0.1"
        let result = ExpressionParser.parse(from: input).operands.queue
        let expectation: [Double] = [123.3, -12.233, 10, -152.25, -0.1]
        XCTAssertEqual(result, expectation)
    }
}

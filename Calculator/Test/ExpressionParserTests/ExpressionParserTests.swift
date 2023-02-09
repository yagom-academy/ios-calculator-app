//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by kaki on 2023/01/27.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    func test_5_더하기_10_곱하기_4_나누기_6_빼기_15는_마이너스5인가() {
        // given
        let input = "5+10×4÷6−15"
        let expectation = -5.0
        // when
        var parseTest = ExpressionParser.parse(from: input)
        let result = parseTest.result()
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_5_빼기_마이너스8은_13인가() {
        // given
        let input = "5−-8"
        let expectation = 13.0
        // when
        var parseTest = ExpressionParser.parse(from: input)
        let result = parseTest.result()
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse호출시_연산자와숫자가분리된큐데이터가저장된Formula반환한다() {
        // given
        let input = "1+2−3×4+5+10÷6−7"
        let expectationOperands: [Double] = [ 1, 2, 3, 4, 5, 10, 6, 7]
        let expectationOperators = [ "+", "−", "×", "+", "+", "÷", "−" ]
        
        // when
        var result = ExpressionParser.parse(from: input)
        
        // then
        expectationOperands.forEach {
            let resultOperands = result.operands.dequeue()
            XCTAssertEqual($0, resultOperands)
        }
        
        expectationOperators.forEach {
            let resultOperator = result.operaters.dequeue()
            XCTAssertEqual($0.first, resultOperator?.rawValue)
        }
    }
}

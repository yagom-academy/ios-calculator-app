//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by kaki on 2023/01/27.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    func test_parse호출시_operands_큐데이터가_저장된_Formula를_반환한다() {
        // given
        let input = "1+2−3×4+5+10÷6−-7"
        let expectationOperands: [Double] = [1, 2, 3, 4, 5, 10, 6, -7]
        // when
        var result = ExpressionParser.parse(from: input)
        // then
        expectationOperands.forEach {
            let resultOperands = result.operands.dequeue()
            XCTAssertEqual($0, resultOperands)
        }
    }
    
    func test_parse호출시_operators_큐데이터가_저장된_Formula를_반환한다() {
        // given
        let input = "1+2−3×4+5+10÷6−-7"
        let expectationOperators = [ "+", "−", "×", "+", "+", "÷", "−" ]
        // when
        var result = ExpressionParser.parse(from: input)
        // then
        expectationOperators.forEach {
            let resultOperator = result.operaters.dequeue()
            XCTAssertEqual($0.first, resultOperator?.rawValue)
        }
    }
}

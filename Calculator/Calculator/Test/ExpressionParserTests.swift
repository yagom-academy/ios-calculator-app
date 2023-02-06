//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by kokkilE on 2023/01/27.
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
    
    func test_parse호출시_연산자와숫자가분리된큐데이터가저장된Formula반환한다() {
        // given
        let input = "1+2−3×4+5+10÷6−7"
        let expectationOperands: [Double] = [ 1, 2, 3, 4, 5, 10, 6, 7]
        let expectationOperators = [ "+", "−", "×", "+", "+", "÷", "−" ]
        
        // when
        var result = ExpressionParser.parse(from: input)
        
        // then
        expectationOperands.forEach {
            let resultOperands = result.operands.dequeueCalculateItems()?.data
            XCTAssertEqual($0, resultOperands)
        }
        
        expectationOperators.forEach {
            let resultOperator = result.operators.dequeueCalculateItems()?.data
            XCTAssertEqual($0.first, resultOperator?.rawValue)
        }
    }
}

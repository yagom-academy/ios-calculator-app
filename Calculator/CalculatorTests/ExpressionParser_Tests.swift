//
//  ExpressionParser_Tests.swift
//  CalculatorTests
//
//  Created by 1 on 2021/11/15.
//

import XCTest
@testable import Calculator

class ExpressionParser_Tests: XCTestCase {
     
    func test_parse호출시_Formula인스턴스를_반환한다() {
        let input = "1.0➕9.0➖-2.0➗4.0✖️5.0"
        
        XCTAssertNotNil(ExpressionParser.parse(from: input))
    }
    
    func test_parse호출시_Formula인스턴스를_반환하고_result를_호출하면_연산값을_반환한다() {
        let input = "1.0➕9.0➖-2.0➗4.0✖️5.0"
        var formula = ExpressionParser.parse(from: input)
        
        XCTAssertEqual(formula.result(), 15.0)
    }
    
    func test_parse호출시_input에서_0으로나누면_result는_NaN을_반환한다() {
        let input = "1.0➕9.0➖-2.0➗0.0✖️5.0"
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()
        
        XCTAssertTrue(result.isNaN)
    }
}


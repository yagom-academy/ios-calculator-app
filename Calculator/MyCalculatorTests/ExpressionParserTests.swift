//
//  ExpressionParserTests.swift
//  MyCalculatorTests
//
//  Created by yeton on 2022/05/20.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_ExpressionParser에서_input으로_값을넣으면_operands와operators가_올바르게나온다_1() {
        // given
        let input = "34 + 5 + 7"
        
        // when
        var formula = ExpressionParser.parse(from: input)
        // then
        XCTAssertEqual(try formula.result(), 46)
    }
    
    func test_ExpressionParser에서_input으로_값을넣으면_operands와operators가_올바르게나온다_2() throws {
        // given
        let input = "30 / 1 + 7"
        
        // when
        var formula = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(try formula.result(), 37)
    }
    
    func test_ExpressionParser에서_input으로_음수값을넣어도_operands와operators가_올바르게나온다() throws {
        // given
        let input = "30 / 1 + -7"
        
        // when
        var formula = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(try formula.result(), 23)
    }
    
    func test_ExpressionParser에서_input에_소수점이있는값을넣으면_결과가제대로반환된다() throws {
           // given
           let input = "30 / 3 + 2.5 - 7"
           
           // when
           var formula = ExpressionParser.parse(from: input)
           
           // then
           XCTAssertEqual(try formula.result(), 5.5)
       }
    
    func test_ExpressionParser에서_input에_빈String을넣으면_0이반환된다() throws {
           // given
           let input = ""
           
           // when
           var formula = ExpressionParser.parse(from: input)
           
           // then
           XCTAssertEqual(try formula.result(), 0)
       }
}


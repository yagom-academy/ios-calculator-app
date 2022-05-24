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
    
    func  test_componentsByOperators에서_input에_값을넣으면_연산자만추출된다() {
        // given
        let input = "30-4+5*6"
        
        // when
        let operands = ExpressionParser.componentsByOperands(from: input)
        
        // then
        XCTAssertEqual(operands, ["-","+","*"])
    }
    
    func  test_componentsByOperands에서_input에_값을넣으면_숫자만추출된다() {
        // given
        let input = "30-4+5*6"
        
        // when
        let operators = ExpressionParser.componentsByOperators(from: input)
        
        // then
        XCTAssertEqual(operators, ["30","4","5","6"])
    }
    
    func test_ExpressionParser에서_input에_값을넣으면_결과가제대로반환된다() throws {
        // given
        let input = "30/3+2-7"
        
        // when
        var formula = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(try formula.result(), 5)
    }
    
    func test_ExpressionParser에서_input에_소수점이있는값을넣으면_결과가제대로반환된다() throws {
        // given
        let input = "30/3+2.5-7"
        
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

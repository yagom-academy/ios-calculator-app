//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by jiye Yi on 2023/01/27.
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
    
    func test_input에_숫자를입력하면_operands에_값이입력된다() {
        //given
        let input = "1"
        
        //when
        let formula = ExpressionParser.parse(from: input)
        let result = formula.operands.isEmpty
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_input에_add를입력하면_operator에_값이입력된다() {
        // given
        let input = "+"
        
        // when
        let formula = ExpressionParser.parse(from: input)
        let result = formula.operators.isEmpty
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_input에_피연산자와_연산자가들어가면_값이계산된다() {
        // given
        let input = "1 + 1"
        
        //when
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()
        
        //then
        XCTAssertEqual(result, 2)
    }
    
    func test_input에_0을나누면_isNaN이_True이다() {
        //given
        let input = "1 % 0"
        let expectation = true
        
        //when
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()?.isNaN
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_input에_피연산자1개와_연산자1개가_입력되면_피연산자가_그대로반환된다() {
        //given
        let input = "1 -"
        let expectation: Double = 1
        
        //when
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_10곱하기2더하기5나누기5는_5이다() {
        //given
        let input = "10 x 2 + 5 % 5"
        let expectation: Double = 5
        
        //when
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()
        
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_음수가있는경우_10곱하기음수5는_음수50이다() {
        //given
        let input = "10 x -5"
        let expectation: Double = -50
        
        //when
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
}

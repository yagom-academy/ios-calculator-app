//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 이원빈 on 2022/05/24.
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
    
    func test_문자열에서_operands_operators의_최소갯수_불만족시_notEnoughInput에러를_던지는지() {
        //given
        let str = "3 +"
        let expectation = FormulaError.notEnoughInput
        //when
        var formula = ExpressionParser.parse(from: str)
        //then
        XCTAssertThrowsError(try formula.result()) { error in
            XCTAssertEqual(expectation, error as? FormulaError)
        }
    }
    
    func test_문자열이주어졌을때_연산자와_피연산자가_구분되서배열에담기는지() {
        //given
        let str = "3 + 9 × 2"
        let operandsExpectation: [Double] = [3,9,2]
        let operatorsExpectation: [Character] = ["+", "×"]
        //when
        let formula = ExpressionParser.parse(from: str)
        //then
        XCTAssertEqual(operandsExpectation, formula.operands.currentStack)
        XCTAssertEqual(operatorsExpectation, formula.operators.currentStack)
    }
    
    func test_문자열이주어졌을때_Fomula의result로_계산결과가출력되는지() {
        //given
        let str = "3 + 9 × 2"
        let expectation = Double(24)
        //when
        var formula = ExpressionParser.parse(from: str)
        let result = try! formula.result()
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_문자열이주어졌을때_나누기0이있다면_dividedByZero에러를던지는지() {
        //given
        let str = "3 ÷ 0 + 9 × 2"
        let expectation = OperatorError.dividedByZero
        //when
        var formula = ExpressionParser.parse(from: str)
        //then
        XCTAssertThrowsError(try formula.result()) { error in
            XCTAssertEqual(expectation, error as? OperatorError)
        }
    }
    
    func test_문자열이주어졌을때_음수가있다면_계산이되는지() {
        //given
        let str = "1 + -2 × -7"
        let expectation = Double(7)
        //when
        var formula = ExpressionParser.parse(from: str)
        let result = try! formula.result()
        //then
        XCTAssertEqual(expectation, result)
    }
}


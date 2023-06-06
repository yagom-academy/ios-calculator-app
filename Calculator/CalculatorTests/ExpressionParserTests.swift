//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 비모 on 2023/06/06.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        
    }

    func test_componentsByOperators_숫자와_연산자가_섞인_문자열을_연산자로_나누고_숫자배열을_반환한다() {
        // given
        let numberWithOperators = "1+2−3÷4×5"
        let expectedResult = ["1", "2", "3", "4", "5"]
        
        // when
        let result = ExpressionParserMock.componentsByOperators(from: numberWithOperators)
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_parse_operands에는_입력한_문자열의_숫자만_있다() {
        // given
        let numberWithOperators = "1.0+2.0−3.0÷4.0×5.0"
        let expectedResult = [1.0, 2.0, 3.0, 4.0, 5.0]
        
        // when
        var operands = ExpressionParserMock.parse(from: numberWithOperators).operands
        var result: [Double] = []
        
        for _ in 0..<operands.count {
            result.append(operands.dequeue()!)
        }
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_parse_operators에는_입력한_문자열의_연산자만_있다() {
        // given
        let numberWithOperators = "1.0+2.0−3.0÷4.0×5.0"
        let expectedResult = [Operator.add, Operator.subtract, Operator.divide, Operator.multiply]
        
        // when
        var operators = ExpressionParserMock.parse(from: numberWithOperators).operators
        var result: [Operator] = []
        
        for _ in 0..<operators.count {
            result.append(operators.dequeue()!)
        }
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_parse_마이너스_사인과_하이픈_마이너스를_구분하여_operands_와_operator에_값이_들어있다() {
        // given
        let numberWithOperators = "-1.0−-1.0" // (Hyphen Minus)1.0(Minus Sign)(Hyphen Minus)1.0
        let expectedOperandsResult: [Double] = [-1.0, -1.0]
        let expectedOperatorsResult: [Operator] = [Operator.subtract]
        
        // when
        var formula = ExpressionParserMock.parse(from: numberWithOperators)
        
        var operandsResult: [Double] = []
        
        for _ in 0..<formula.operands.count {
            operandsResult.append(formula.operands.dequeue()!)
        }
        
        var operatorsResult: [Operator] = []
        
        for _ in 0..<formula.operators.count {
            operatorsResult.append(formula.operators.dequeue()!)
        }
        
        // then
        XCTAssertEqual(operandsResult, expectedOperandsResult)
        XCTAssertEqual(operatorsResult, expectedOperatorsResult)
    }
}

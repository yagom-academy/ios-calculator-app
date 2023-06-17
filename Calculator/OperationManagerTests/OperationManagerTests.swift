//
//  OperationManagerTests.swift
//  OperationManagerTests
//
//  Created by 표현수 on 2023/06/14.
//

import XCTest
@testable import Calculator

final class OperationManagerTests: XCTestCase {
    var sut: OperationManager!
    
    override func setUpWithError() throws {
        sut = OperationManager()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_formula가_비어있는_상태로_calculateFormula를_호출하면_문자_0이_반환됩니다() {
        let expectation = CalculatorNamespace.zero
        
        let result = sut.calculateFormula()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_formula에_수식을_넣고_calculateFormula를_호출하면_그에_맞는_값을_반환합니다() {
        sut.addFormula("", "1")
        sut.addFormula("+", "2")
        sut.addFormula("+", "3")
        sut.addFormula("+", "4")
        sut.addFormula("+", "5")
        let expectation = "15"
        
        let result = sut.calculateFormula()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_formula가_비어있을때_addFormula에_연산자와_피연산자를_입력하지_않는다면_빈문자열을_반환합니다() {
        let expectation = (operandValue: CalculatorNamespace.empty,
                           operatorValue:  CalculatorNamespace.empty)
        
        let result = sut.addFormula("", "0")
        
        XCTAssertEqual(result.operandValue, expectation.operandValue)
        XCTAssertEqual(result.operatorValue, expectation.operatorValue)
    }
    
    func test_calculateFormula로_계산을_한_이후에는_addOperandsLabel로_숫자_두개를_입력하면_첫번쨰_인자를_0으로_변환합니다() {
        sut.addFormula("", "1")
        sut.addFormula("+", "2")
        sut.addFormula("+", "3")
        sut.addFormula("+", "4")
        sut.addFormula("+", "5")
        let formulaResult = sut.calculateFormula()
        let input = "9"
        let expectation = "09"
        
        let result = sut.addOperandsLabel(formulaResult, input)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_addOperandsLabel로_문자열이_입력되었을때_12자리를_초과하는_내용은_더_이상_입력되지_않습니다() {
        let input = "999999999999"
        let expectation = input
        
        let result = sut.addOperandsLabel(input, "9")
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_소수점이_포함된_숫자와_소수점을_addOperandsLabel로_전달하면_두번째_소수점이_무시됩니다() {
        let input = "0."
        let expectation = input
        
        let result = sut.addOperandsLabel(input, CalculatorNamespace.dot)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_0일때_changeSign을_호출하면_부호가_붙지_않습니다() {
        let input = "0"
        let expectation = input
        
        let result = sut.changeSign(input)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_양수일때_changeSign을_호출하면_음수로_변환됩니다() {
        let input = "1"
        let expectation = "-1"
        
        let result = sut.changeSign(input)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_음수일때_changeSign을_호출하면_양수로_변환됩니다() {
        let input = "-1"
        let expectation = "1"
        
        let result = sut.changeSign(input)
        
        XCTAssertEqual(result, expectation)
    }
}

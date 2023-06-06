//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by EtialMoon on 2023/06/04.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    var sut: StubExpressionParser!
    let testFormula1 = "1+2−3*4/5"
    let testFormula2 = "1−-2"

    override func setUpWithError() throws {
        sut = StubExpressionParser()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_componentsByOperators에_testFormula1을넣으면_숫자만남은배열이반환된다() {
        let expectation = ["1", "2", "3", "4", "5"]
        
        let result = sut.componentsByOperators(from: testFormula1)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_componentsByOperators에_testFormula2을넣으면_숫자만남은배열이반환된다() {
        let expectation = ["1", "-2"]
        
        let result = sut.componentsByOperators(from: testFormula2)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse에_testFormula1을넣으면_Formula의operands와operators로나뉜다() throws {
        var expectedFormula = Formula()
        for operand in 1...5 {
            expectedFormula.operands.enqueue(Double(operand))
        }
        expectedFormula.operators.enqueue(Operator.add)
        expectedFormula.operators.enqueue(Operator.subtract)
        expectedFormula.operators.enqueue(Operator.multiply)
        expectedFormula.operators.enqueue(Operator.divide)
        let expectedOperands = expectedFormula.operands.enqueuedCalculatorItems
        let expectedOperators = expectedFormula.operators.enqueuedCalculatorItems
        let formula = try sut.parse(from: testFormula1)
        
        let resultOperands = formula.operands.enqueuedCalculatorItems
        let resultOperators = formula.operators.enqueuedCalculatorItems
        
        XCTAssertEqual(resultOperands, expectedOperands)
        XCTAssertEqual(resultOperators, expectedOperators)
    }
    
    func test_parse에_testFormula2을넣으면_Formula의operands와operators로나뉜다() throws {
        var expectedFormula = Formula()
        expectedFormula.operands.enqueue(1.0)
        expectedFormula.operands.enqueue(-2.0)
        expectedFormula.operators.enqueue(Operator.subtract)
        let expectedOperands = expectedFormula.operands.enqueuedCalculatorItems
        let expectedOperators = expectedFormula.operators.enqueuedCalculatorItems
        let formula = try sut.parse(from: testFormula2)
        
        let resultOperands = formula.operands.enqueuedCalculatorItems
        let resultOperators = formula.operators.enqueuedCalculatorItems
        
        XCTAssertEqual(resultOperands, expectedOperands)
        XCTAssertEqual(resultOperators, expectedOperators)
    }
}

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
    let testFormula1 = "5+4−3*2/1"
    let testFormula2 = "1−-2"

    override func setUpWithError() throws {
        sut = StubExpressionParser()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_componentsByOperators에_testFormula1을넣으면_숫자만남은배열이반환된다() {
        let expectation = ["5", "4", "3", "2", "1",]
        
        let result = sut.componentsByOperators(from: testFormula1)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_componentsByOperators에_testFormula2을넣으면_숫자만남은배열이반환된다() {
        let expectation = ["1", "-2"]
        
        let result = sut.componentsByOperators(from: testFormula2)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_parse에_testFormula1을넣으면_Formula의operands와operators로나뉜다() throws {
        let expectedOperands = CalculatorItemQueue(
            enqueuedCalculatorItems: [5.0, 4.0, 3.0, 2.0, 1.0]
        ).enqueuedCalculatorItems
        let expectedOperators = CalculatorItemQueue(
            enqueuedCalculatorItems: [Operator.add, Operator.subtract, Operator.multiply, Operator.divide]
        ).enqueuedCalculatorItems
        try sut.parse(from: testFormula1)
        
        let resultOperands = sut.operandsQueue.enqueuedCalculatorItems
        let resultOperators = sut.operatorsQueue.enqueuedCalculatorItems
        
        XCTAssertEqual(resultOperands, expectedOperands)
        XCTAssertEqual(resultOperators, expectedOperators)
    }
    
    func test_parse에_testFormula2을넣으면_Formula의operands와operators로나뉜다() throws {
        let expectedOperands = CalculatorItemQueue(
            enqueuedCalculatorItems: [1.0, -2.0]
        ).enqueuedCalculatorItems
        let expectedOperators = CalculatorItemQueue(
            enqueuedCalculatorItems: [Operator.subtract]
        ).enqueuedCalculatorItems
        try sut.parse(from: testFormula2)
        
        let resultOperands = sut.operandsQueue.enqueuedCalculatorItems
        let resultOperators = sut.operatorsQueue.enqueuedCalculatorItems
        
        XCTAssertEqual(resultOperands, expectedOperands)
        XCTAssertEqual(resultOperators, expectedOperators)
    }
}

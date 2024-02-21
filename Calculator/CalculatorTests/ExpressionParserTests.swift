//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by Danny on 2/20/24.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    var formulaSut: Formula!
    var operands: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        operands = CalculatorItemQueue()
        operators = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        operands = nil
        operators = nil
    }
    
    func test_ExpressionParser_parse_실행결과_테스트1() {
        // given
        formulaSut = ExpressionParser.parse(from: "123 + 234 +")
        
        // when
        let expectationOfOperands: [Double] = [123, 234]
        let expectationOfOperators: [Operator] = [Operator.add, Operator.add]
        expectationOfOperands.forEach { operands.push($0) }
        expectationOfOperators.forEach { operators.push($0) }
        
        let resultOfOperands = formulaSut.operands.queue
        let resultOfOperators = formulaSut.operators.queue
        
        // then
        XCTAssertEqual(expectationOfOperands, resultOfOperands)
        XCTAssertEqual(expectationOfOperators, resultOfOperators)
    }
    
    func test_ExpressionParser_parse_실행결과_테스트2() {
        // given
        formulaSut = ExpressionParser.parse(from: "123 + 234 × 234 + 123 × 33 - 1.33 ÷ 1000 - 1")
        
        // when
        let expectationOfOperands: [Double] = [123.0, 234.0, 234.0, 123.0, 33.0, 1.33, 1000.0, 1.0]
        let expectationOfOperators: [Operator] = [Calculator.Operator.add, Calculator.Operator.multiply, Calculator.Operator.add, Calculator.Operator.multiply, Calculator.Operator.subtract, Calculator.Operator.divide, Calculator.Operator.subtract]
        expectationOfOperands.forEach { operands.push($0) }
        expectationOfOperators.forEach { operators.push($0) }
        
        let resultOfOperands = formulaSut.operands.queue
        let resultOfOperators = formulaSut.operators.queue
        
        // then
        XCTAssertEqual(expectationOfOperands, resultOfOperands)
        XCTAssertEqual(expectationOfOperators, resultOfOperators)
    }
    
    func test_ExpressionParser_parse_실행결과_테스트3() {
        // given
        formulaSut = ExpressionParser.parse(from: "123 ÷ 234 + 0 ÷ 0")
        
        // when
        let expectationOfOperands: [Double] = [123, 234, 0, 0]
        let expectationOfOperators: [Operator] = [Operator.divide, Operator.add, Operator.divide]
        expectationOfOperands.forEach { operands.push($0) }
        expectationOfOperators.forEach { operators.push($0) }
        
        let resultOfOperands = formulaSut.operands.queue
        let resultOfOperators = formulaSut.operators.queue
        
        // then
        XCTAssertEqual(expectationOfOperands, resultOfOperands)
        XCTAssertEqual(expectationOfOperators, resultOfOperators)
    }
}

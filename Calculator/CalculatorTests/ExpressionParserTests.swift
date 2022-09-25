//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by SummerCat on 2022/09/25.
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
    
    func test_parse_1더하기11빼기3넣으면_1과11과3을가진배열반환() {
        // given
        let input = "1+22-3"
        var expectedOperands = CalculatorItemQueue<Double>()
        expectedOperands.enqueue(item: 1)
        expectedOperands.enqueue(item: 22)
        expectedOperands.enqueue(item: 3)
        var expectedOperators = CalculatorItemQueue<Operator>()
        expectedOperators.enqueue(item: .add)
        expectedOperators.enqueue(item: .subtract)
        
        // when
        let result = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(result.operands.inputStack, expectedOperands.inputStack)
        XCTAssertEqual(result.operators.inputStack, expectedOperators.inputStack)
    }
    
    func test_parse_입력값에_음수가_포함된경우_제대로처리하는지() {
        // given
        let input = "1 - -1"
        var expectedOperands = CalculatorItemQueue<Double>()
        expectedOperands.enqueue(item: 1)
        expectedOperands.enqueue(item: -1)
        var expectedOperators = CalculatorItemQueue<Operator>()
        expectedOperators.enqueue(item: .subtract)
        
        // when
        let result = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(result.operands.inputStack, expectedOperands.inputStack)
        XCTAssertEqual(result.operators.inputStack, expectedOperators.inputStack)
    }
    
    func test_parse_입력값에_연산자가_연속으로_들어온경우_앞의연산자는제거() {
        // given
        let input = "1 + - + * 5"
        var expectedOperands = CalculatorItemQueue<Double>()
        expectedOperands.enqueue(item: 1)
        expectedOperands.enqueue(item: 5)
        var expectedOperators = CalculatorItemQueue<Operator>()
        expectedOperators.enqueue(item: .multiply)
        
        // when
        let result = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(result.operands.inputStack, expectedOperands.inputStack)
        XCTAssertEqual(result.operators.inputStack, expectedOperators.inputStack)
    }
}

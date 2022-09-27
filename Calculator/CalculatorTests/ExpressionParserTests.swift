//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by SummerCat on 2022/09/25.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    var expectedOperands: CalculatorItemQueue! = CalculatorItemQueue<Double>()
    var expectedOperators: CalculatorItemQueue! = CalculatorItemQueue<Operator>()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        expectedOperands = nil
        expectedOperators = nil
    }
    
    func test_parse_1더하기11빼기3넣으면_1과11과3을가진배열반환() {
        // given
        let input = "1 + 22 - 3"
        expectedOperands.enqueue(item: 1)
        expectedOperands.enqueue(item: 22)
        expectedOperands.enqueue(item: 3)
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
        let input = "1--1"
        expectedOperands.enqueue(item: 1)
        expectedOperands.enqueue(item: -1)
        expectedOperators.enqueue(item: .subtract)
        
        // when
        let result = ExpressionParser.parse(from: input)
        
        // then
        XCTAssertEqual(result.operands.inputStack, expectedOperands.inputStack)
        XCTAssertEqual(result.operators.inputStack, expectedOperators.inputStack)
    }
}

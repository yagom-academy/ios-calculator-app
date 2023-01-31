//
//  ExpressionParserTests.swift
//  CalculatorQueueTests
//
//  Created by 송종환 on 2023/01/31.
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
    
    func test_parse에_연산String값을_입력헀을때_연산자와_피연산자를_분류해_배열로_반환한다() {
        
        let input = "1+2-23*41/12"
        let expectedOperatorResult: [Operator] = [.add, .subtract, .divide, .multiply]
        let expectedOperandResult: [Double] = [1, 2, 23, 41, 12]
         
        var parseTest = ExpressionParser.parse(from: input)
        let operatorResult = parseTest.operators.enqueueStack
        let operandResult = parseTest.operands.enqueueStack
        
        XCTAssertEqual(expectedOperatorResult, operatorResult)
        XCTAssertEqual(expectedOperandResult, operandResult)
    }

}

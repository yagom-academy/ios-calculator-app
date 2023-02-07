//
//  FormulaTest.swift
//  FormulaTest
//
//  Created by 천승현 on 2023/01/27.
//

import XCTest
@testable import Calculator

final class FormulaTest: XCTestCase {
    
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_result호출시_2_더하기_5_곱하기_4_나누기_2는_14이다() {
        let operands = [2.0, 5.0, 4.0, 2.0]
        let operators = [Operator.add, Operator.multiply, Operator.divide]
        
        let operandQueue = CalculatorItemQueue<Double>(enqueueStack: operands)
        let operatorQueue = CalculatorItemQueue<Operator>(enqueueStack: operators)
        let expectation = 14.0
        
        // when
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }

    func test_result호출시_32_나누기_8_곱하기_4_곱하기_0은_0이다() {
        let operands = [32.0, 8.0, 4.0, 0.0]
        let operators = [Operator.divide, Operator.multiply, Operator.multiply]
        
        let operandQueue = CalculatorItemQueue<Double>(enqueueStack: operands)
        let operatorQueue = CalculatorItemQueue<Operator>(enqueueStack: operators)
        let expectation = 0.0
        
        // when
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_result호출시_32_나누기_5_더하기_3_나누기_0은_NaN이다() {
        // given
        let operands = [32.0, 5.0, 3.0, 0.0]
        let operators = [Operator.divide, Operator.add, Operator.divide]
        
        let operandQueue = CalculatorItemQueue<Double>(enqueueStack: operands)
        let operatorQueue = CalculatorItemQueue<Operator>(enqueueStack: operators)
        
        // when
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        let result = sut.result()
        
        // then
        XCTAssertTrue(result.isNaN)
    }
    
    func test_result호출시_음수30_나누기_6_곱하기_음수5는_25이다() {
        // given
        let operands = [-30.0, 6.0, -5.0]
        let operators = [Operator.divide, Operator.multiply]
        
        let operandQueue = CalculatorItemQueue<Double>(enqueueStack: operands)
        let operatorQueue = CalculatorItemQueue<Operator>(enqueueStack: operators)
        let expectation = 25.0
        
        // when
        sut = Formula(operands: operandQueue, operators: operatorQueue)
        let result = sut.result()
        
        // then
        XCTAssertEqual(result, expectation)
    }
}

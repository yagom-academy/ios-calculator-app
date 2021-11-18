//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by 예거 on 2021/11/15.
//

import XCTest

class FormulaTests: XCTestCase {
    
    func test_result메서드_0으로_나누면_Double타입의_NaN_반환() {
        let operands = CalculatorItemQueue(queue: [10, 0])
        let operators = CalculatorItemQueue(queue: [Operator.divide])
        let formula = Formula(operands: operands, operators: operators)
        let result = formula.result()
        XCTAssertTrue(result.isNaN)
    }
    
    func test_result메서드_연산자_1개일때_계산_확인() {
        let operands = CalculatorItemQueue(queue: [2.5, -2.5])
        let operators = CalculatorItemQueue(queue: [Operator.subtract])
        let formula = Formula(operands: operands, operators: operators)
        let result = formula.result()
        let expectation: Double = 5
        XCTAssertEqual(result, expectation)
    }
    
    func test_result메서드_연산자_2개일때_계산_확인() {
        let operands = CalculatorItemQueue(queue: [10, -2.5, -4])
        let operators = CalculatorItemQueue(queue: [Operator.divide, Operator.multiply])
        let formula = Formula(operands: operands, operators: operators)
        let result = formula.result()
        let expectation: Double = 16
        XCTAssertEqual(result, expectation)
    }
    
    func test_result메서드_연산자_3개일때_계산_확인() {
        let operands = CalculatorItemQueue(queue: [2, -4, 1.5, 10])
        let operators = CalculatorItemQueue(queue: [Operator.subtract, Operator.divide, Operator.multiply])
        let formula = Formula(operands: operands, operators: operators)
        let result = formula.result()
        let expectation: Double = 40
        XCTAssertEqual(result, expectation)
    }
    
    func test_result메서드_연산자_3개인데_중간에_0으로_나뉘는_경우의_계산_확인() {
        let operands = CalculatorItemQueue(queue: [2, -4, 0, 10])
        let operators = CalculatorItemQueue(queue: [Operator.subtract, Operator.divide, Operator.multiply])
        let formula = Formula(operands: operands, operators: operators)
        let result = formula.result()
        XCTAssertTrue(result.isNaN)
    }
}

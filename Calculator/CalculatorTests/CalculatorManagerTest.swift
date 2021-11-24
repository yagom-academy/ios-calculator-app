//
//  CalculatorManagerTest.swift
//  CalculatorTests
//
//  Created by 이차민 on 2021/11/24.
//

import XCTest

class CalculatorManagerTest: XCTestCase {
    var calculatorManager = CalculatorManager(operand: "12", operator: "+", expression: "12.5+30.1-3.5", isCalculated: false)
        
    func test_피연산자가_0으로_초기화되는지() {
        calculatorManager.resetOperand()
        XCTAssertEqual("0", calculatorManager.operand)
    }
    
    func test_CalculatorManager의_프로퍼티들이_제대로_초기화되는지() {
        calculatorManager.reset()
        XCTAssertEqual("", calculatorManager.operator)
        XCTAssertEqual("", calculatorManager.expression)
        XCTAssertFalse(calculatorManager.isCalculated)
    }
}

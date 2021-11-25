//
//  CalculatorManagerTest.swift
//  CalculatorTests
//
//  Created by 이차민 on 2021/11/24.
//

import XCTest

class CalculatorManagerTest: XCTestCase {
    func test_피연산자가_0으로_초기화되는지() {
        var calculatorManager = CalculatorManager(currentOperand: "12", currentOperator: "+", expression: "12.5+30.1-3.5", isCalculated: false)
        calculatorManager.resetOperand()
        XCTAssertEqual("0", calculatorManager.currentOperand)
    }
    
    func test_CalculatorManager의_프로퍼티들이_제대로_초기화되는지() {
        var calculatorManager = CalculatorManager(currentOperand: "12", currentOperator: "+", expression: "12.5+30.1-3.5", isCalculated: false)
        calculatorManager.reset()
        XCTAssertEqual("", calculatorManager.currentOperator)
        XCTAssertEqual("", calculatorManager.expression)
        XCTAssertFalse(calculatorManager.isCalculated)
    }
    
    func test_현재_피연산자가_0일_때_입력받은_피연산자가_0일경우_무시하는지() {
        var calculatorManager = CalculatorManager(currentOperand: "0", currentOperator: "", expression: "", isCalculated: false)
        calculatorManager.fetchOperand(input: "0")
        XCTAssertEqual("0", calculatorManager.currentOperand)
    }
    
    func test_현재_피연산자가_0일_때_입력받은_피연산자가_00일경우_무시하는지() {
        var calculatorManager = CalculatorManager(currentOperand: "0", currentOperator: "", expression: "", isCalculated: false)
        calculatorManager.fetchOperand(input: "00")
        XCTAssertEqual("0", calculatorManager.currentOperand)
    }
    
    func test_현재_피연산자가_0일_때_입력받은_피연산자가_0이_아닐경우_값이_누적되는지() {
        var calculatorManager = CalculatorManager(currentOperand: "0", currentOperator: "", expression: "", isCalculated: false)
        calculatorManager.fetchOperand(input: "3")
        XCTAssertEqual("3", calculatorManager.currentOperand)
    }
    
    func test_Double타입의_숫자가_17자리를_넘는경우_true를_반환하는지() {
        let calculatorManager = CalculatorManager(currentOperand: "0", currentOperator: "", expression: "", isCalculated: false)
        let number: Double = 10000000000000000
        XCTAssertTrue(calculatorManager.isNumberOverMaximumExpression(number: number))
    }
    
    func test_3자리마다_콤마를_찍어주는지() {
        let calculatorManager = CalculatorManager(currentOperand: "12345", currentOperator: "", expression: "", isCalculated: false)
        guard let result = calculatorManager.addCommaOnEveryThreeDigits(to: calculatorManager.currentOperand) else {
            return
        }
        XCTAssertEqual("12,345", result)
    }
    
    func test_입력된값을_정수부와_소수부로_나누어_반환하는지() {
        let calculatorManager = CalculatorManager(currentOperand: "123.45", currentOperator: "", expression: "", isCalculated: false)
        let separated = calculatorManager.splitWithIntegerAndFraction(from: calculatorManager.currentOperand)
        XCTAssertEqual("123", separated.integer)
        XCTAssertEqual("45", separated.fraction)
    }
    
    func test_입력된_값의_부호를_반대로_바꿔주는지() {
        var calculatorManager = CalculatorManager(currentOperand: "12345", currentOperator: "", expression: "", isCalculated: false)
        
        var numb = "123,45"
        calculatorManager.toggleOperandSign(from: &numb)
        XCTAssertEqual("-123,45", numb)
        XCTAssertEqual("-12345", calculatorManager.currentOperand)
    }
    
    func test_입력된_연산자와_피연산자가_수식에_제대로_추가되는지() {
        var calculatorManager = CalculatorManager(currentOperand: "", currentOperator: "", expression: "", isCalculated: false)
        let operand = "12"
        let `operator` = "+"
        calculatorManager.fetchExpression(operand: operand, operator: `operator`)
        XCTAssertEqual("12+", calculatorManager.expression)
    }
    
    func test_수식을_받아_정상적으로_연산을_하는지() {
        let calculatorManager = CalculatorManager(currentOperand: "", currentOperator: "", expression: "1.5+3.5×2.0", isCalculated: false)
        XCTAssertEqual(10.0, try calculatorManager.doCalculate())
    }
    
    func test_수식에_0으로_나누는_경우가_있을_때_NaN을_반환하는지() {
        let calculatorManager = CalculatorManager(currentOperand: "", currentOperator: "", expression: "1.5+3.5÷0.0", isCalculated: false)
        XCTAssertThrowsError(try calculatorManager.doCalculate()) { error in
            XCTAssertEqual(error as! OperationError, OperationError.dividedByZero)
        }
    }
}

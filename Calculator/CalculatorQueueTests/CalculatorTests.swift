//
//  CalculatorTests.swift
//  CalculatorQueueTests
//
//  Created by JeongTaek Han on 2021/11/25.
//

import XCTest

class CalculatorTests: XCTestCase {
    
    var sut: Calculator!

    override func setUpWithError() throws {
        sut = Calculator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_1_더하기_1_입력_후_연산했을_때_2를_반환해야한다() {
        sut.inputNumber("1")
        sut.inputOperator("+")
        sut.inputNumber("1")
        sut.calculateAllExpression()
        
        let result = sut.currentInputOperand
        
        XCTAssertEqual(result, "2")
    }
    
    func test_10_나누기_0_입력_후_연산했을_때_0을_반환해야한다() {
        sut.inputNumber("1")
        sut.inputNumber("0")
        sut.inputOperator("÷")
        sut.inputNumber("0")
        sut.calculateAllExpression()
        
        let result = sut.currentInputOperand
        
        XCTAssertEqual(result, "NaN")
    }
    
    func test_0_1_2_7_입력_후_현재_입력된_피연산자_값을_확인하면_127을_반환해야한다() {
        sut.inputNumber("0")
        sut.inputNumber("1")
        sut.inputNumber("2")
        sut.inputNumber("7")
        
        let result = sut.currentInputOperand
        
        XCTAssertEqual(result, "127")
    }
    
    func test_0점2_더하기_0점3_입력_연산했을_때_0점5를_반환해야한다() {
        sut.inputNumber("0")
        sut.inputDot()
        sut.inputNumber("2")
        sut.inputOperator("+")
        sut.inputNumber("0")
        sut.inputDot()
        sut.inputNumber("3")
        sut.calculateAllExpression()
        
        let result = sut.currentInputOperand
        
        XCTAssertEqual(result, "0.5")
    }
    
    func test_0점7_더하기_0점3_입력_연산했을_때_1를_반환해야한다() {
        sut.inputNumber("0")
        sut.inputDot()
        sut.inputNumber("7")
        sut.inputOperator("+")
        sut.inputNumber("0")
        sut.inputDot()
        sut.inputNumber("3")
        sut.calculateAllExpression()
        
        let result = sut.currentInputOperand
        
        XCTAssertEqual(result, "1")
    }
    
    func test_1_입력_후_부호를_변경하면_음수1을_반환해야한다() {
        sut.inputNumber("1")
        sut.changeSignOfNumber()
        
        let result = sut.currentInputOperand
        
        XCTAssertEqual(result, "-1")
    }
    
    func test_0점2_더하기_0점3_입력_후_연산한_뒤에_AC를_입력하면_0을_반환하고_mathExpression이_비어있어야한다() {
        sut.inputNumber("0")
        sut.inputDot()
        sut.inputNumber("2")
        sut.inputOperator("+")
        sut.inputNumber("0")
        sut.inputDot()
        sut.inputNumber("3")
        sut.calculateAllExpression()
        sut.clearAllExpression()
        
        XCTAssertEqual(sut.currentInputOperand, "0")
        XCTAssertTrue(sut.mathExpression.isEmpty)
    }
    
    func test_0점2_더하기_0점3_입력_후_CE를_입력하면_0을_반환하고_mathExpression이_비어있지않아야한다() {
        sut.inputNumber("0")
        sut.inputDot()
        sut.inputNumber("2")
        sut.inputOperator("+")
        sut.inputNumber("0")
        sut.inputDot()
        sut.inputNumber("3")
        sut.clearEntry()
        
        XCTAssertEqual(sut.currentInputOperand, "0")
        XCTAssertFalse(sut.mathExpression.isEmpty)
    }

}

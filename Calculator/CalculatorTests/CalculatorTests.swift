//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Jinho Choi on 2020/12/15.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    private var sut: DecimalCalculator!
    
    override func setUpWithError() throws {
        super.setUp()
        sut = DecimalCalculator()
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testAdditionBasicFunction() {
        XCTAssertEqual(sut.add(oldOperand: 3, newOperand: 5), 8)
    }
    
    func testSubtractionBasicFunction() {
        XCTAssertEqual(sut.subtract(oldOperand: 40, newOperand: 13), 27)
    }
    
    func testMultiplicationBasicFunction() {
        XCTAssertEqual(sut.multiply(oldOperand: 2, newOperand: 3), 6)
    }
    
    func testDivisionBasicFunction() {
        XCTAssertEqual(sut.divide(oldOperand: 20, newOperand: 2), 10)
    }
    
    func testDivisionAboutZero() {
        XCTAssertEqual(sut.divide(oldOperand: 2, newOperand: 0), Double.infinity)
    }
    
    func testPushToOperandStack() {
        sut.pushOperandOnStack("3")
        sut.pushOperandOnStack("10")
        XCTAssertEqual(sut.operand.stack, ["3","10"])
    }
    
    func testPushToOperatorStack() {
        sut.pushOperatorOnStack(.addition)
        sut.pushOperatorOnStack(.multiplication)
        XCTAssertEqual(sut.`operator`.stack, [Calculator.Operator.addition, Calculator.Operator.multiplication])
    }
    
    func testCheckLastOperator() {
        sut.pushOperatorOnStack(.addition)
        sut.pushOperatorOnStack(.multiplication)
        let expectedValue: Operator = .multiplication
        XCTAssertEqual(sut.checkLastOperator(), expectedValue)
    }
    
    func testOperatorStackStateIsInitial() {
        let expectedValue: Operator = .nothing
        XCTAssertEqual(sut.checkLastOperator(), expectedValue)
    }
    
    func testIsCalculable() {
        XCTAssertFalse(sut.isCalculable())
        sut.pushOperandOnStack("30")
        XCTAssertFalse(sut.isCalculable())
        sut.pushOperandOnStack("10")
        XCTAssertTrue(sut.isCalculable())
    }
    
    func testArithmeticAboutReturnType() {
        let expectedNan = sut.arithmetic(type: .addition)
        XCTAssertFalse(expectedNan == .nan)
        sut.pushOperandOnStack("30")
        sut.pushOperandOnStack("30")
        XCTAssertEqual(sut.arithmetic(type: .addition), 60)
        sut.pushOperandOnStack("20.1")
        sut.pushOperandOnStack("20")
        XCTAssertEqual(sut.arithmetic(type: .addition), 40.1)
    }
    
    func testArithmeticByType() {
        sut.pushOperandOnStack("10")
        sut.pushOperandOnStack("10")
        XCTAssertEqual(sut.arithmetic(type: .addition), 20)
        sut.pushOperandOnStack("10")
        sut.pushOperandOnStack("10")
        XCTAssertEqual(sut.arithmetic(type: .subtraction), 0)
        sut.pushOperandOnStack("10")
        sut.pushOperandOnStack("10")
        XCTAssertEqual(sut.arithmetic(type: .multiplication), 100)
        sut.pushOperandOnStack("10")
        sut.pushOperandOnStack("10")
        XCTAssertEqual(sut.arithmetic(type: .division), 1)
        sut.pushOperandOnStack("0")
        sut.pushOperandOnStack("10")
        XCTAssertEqual(sut.arithmetic(type: .division), 0)
        sut.pushOperandOnStack("10")
        sut.pushOperandOnStack("0")
        XCTAssertEqual(sut.arithmetic(type: .division), Double.infinity)
    }
    
    func testPushOperandAndOperator() {
        sut.pushOperandOnStack("4.4")
        sut.pushOperandOnStack("2.2")
        sut.pushOperatorOnStack(.addition)
        let lastOperator = sut.checkLastOperator()
        let expectedAdd = sut.arithmetic(type: lastOperator)
        let expectedValue: Double = 6.6
        XCTAssertEqual(expectedAdd, expectedValue, accuracy: 1e8)
    }
    
    func testArithmeticLogicByType() {
        sut.pushOperandOnStack("6.2")
        sut.pushOperandOnStack("0")
        sut.pushOperatorOnStack(.addition)
        var lastOperator = sut.checkLastOperator()
        var testedValue = sut.arithmetic(type: lastOperator)
        var expectedValue = 6.2
        XCTAssertEqual(testedValue, expectedValue, accuracy: 1e8)
        
        sut.pushOperandOnStack("6.2")
        sut.pushOperandOnStack("3.1")
        sut.pushOperatorOnStack(.subtraction)
        lastOperator = sut.checkLastOperator()
        testedValue = sut.arithmetic(type: lastOperator)
        expectedValue = 3.1
        XCTAssertEqual(testedValue, expectedValue, accuracy: 1e8)
        
        sut.pushOperandOnStack("6.2")
        sut.pushOperandOnStack("2.1")
        sut.pushOperatorOnStack(.multiplication)
        lastOperator = sut.checkLastOperator()
        testedValue = sut.arithmetic(type: lastOperator)
        expectedValue = 13.01
        XCTAssertEqual(testedValue, expectedValue, accuracy: 1e8)
        
        sut.pushOperandOnStack("6.2")
        sut.pushOperandOnStack("3.1")
        sut.pushOperatorOnStack(.division)
        lastOperator = sut.checkLastOperator()
        testedValue = sut.arithmetic(type: lastOperator)
        expectedValue = 2
        XCTAssertEqual(testedValue, expectedValue, accuracy: 1e8)
    }
    
    func testCheckPreviousOperator() {
        var testedValue = sut.checkPreviousOperator()
        var expectedValue: Operator = .nothing
        XCTAssertEqual(testedValue, expectedValue)
        
        sut.pushOperatorOnStack(.subtraction)
        testedValue = sut.checkPreviousOperator()
        expectedValue = .subtraction
        XCTAssertEqual(testedValue, expectedValue)
        
        sut.pushOperatorOnStack(.division)
        testedValue = sut.checkPreviousOperator()
        expectedValue = .division
        XCTAssertEqual(testedValue, expectedValue)
        
        sut.pushOperatorOnStack(.multiplication)
        testedValue = sut.checkPreviousOperator()
        expectedValue = .multiplication
        XCTAssertEqual(testedValue, expectedValue)
        
        sut.pushOperatorOnStack(.addition)
        testedValue = sut.checkPreviousOperator()
        expectedValue = .addition
        XCTAssertEqual(testedValue, expectedValue)
    }
}

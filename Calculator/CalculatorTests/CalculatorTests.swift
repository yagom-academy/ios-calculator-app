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
    // 연산자를 넣기전에 이전 연산자 체크
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
    // 이전 연산자가 곱셈, 나눗셈이면 연산해주고, 반환되는 결과 Double타입을 String으로 변환해서 푸쉬
    func testWhenPreviousOperatorMultiplicationOrDivision() {
        sut.pushOperandOnStack("4")
        
        var testedValue = sut.checkPreviousOperator()
        XCTAssertEqual(testedValue, .nothing)
        sut.pushOperatorOnStack(.subtraction)
        sut.pushOperandOnStack("20")
        
        testedValue = sut.checkPreviousOperator()
        XCTAssertEqual(testedValue, .subtraction)
        sut.pushOperatorOnStack(.division)
        sut.pushOperandOnStack("5")
        
        testedValue = sut.checkPreviousOperator()
        XCTAssertEqual(testedValue, .division)
        var calculatedValue = sut.arithmetic(type: testedValue)
        XCTAssertEqual(calculatedValue, 4)
        sut.popOperatorOnStack(testedValue)
        sut.pushOperandOnStack(sut.convertDoubleToString(result: calculatedValue))
        sut.pushOperatorOnStack(.multiplication)
        sut.pushOperandOnStack("2")
        
        testedValue = sut.checkPreviousOperator()
        XCTAssertEqual(testedValue, .multiplication)
        calculatedValue = sut.arithmetic(type: testedValue)
        XCTAssertEqual(calculatedValue, 8)
        sut.popOperatorOnStack(testedValue)
        sut.pushOperandOnStack(sut.convertDoubleToString(result: calculatedValue))
        sut.pushOperatorOnStack(.addition)
        sut.pushOperandOnStack("10")
    }
    
    func testWhenPreviousOperatorAdditionOrSubtraction() {
        sut.pushOperandOnStack("4")
        XCTAssertEqual(sut.`operator`.stack.count, 0)
        var lastOperator = sut.`operator`.peek()
        XCTAssertEqual(lastOperator, nil)
        
        var testedValue: () = sut.calculate(userPickOperator: .subtraction)
        var lastOperand = sut.operand.peek()
        lastOperator = sut.`operator`.peek()
        XCTAssertFalse(testedValue == nil)
        XCTAssertEqual(lastOperator, .subtraction)
        XCTAssertEqual(lastOperand, "4")
        
        sut.pushOperandOnStack("8")
        testedValue = sut.calculate(userPickOperator: .addition)
        lastOperand = sut.operand.peek()
        lastOperator = sut.`operator`.peek()
        XCTAssertEqual(lastOperator, .addition)
        // 자리수에 대한 처리를 안해줘 "-4"값을 기대할 수 없음
        XCTAssertEqual(lastOperand, "-4.0")
        
        sut.pushOperandOnStack("10")
        testedValue = sut.calculate(userPickOperator: .subtraction)
        lastOperand = sut.operand.peek()
        lastOperator = sut.`operator`.peek()
        XCTAssertEqual(lastOperator, .subtraction)
        XCTAssertEqual(lastOperand, "6.0")
        
        sut.pushOperandOnStack("1")
        testedValue = sut.calculate(userPickOperator: .equal)
        lastOperand = sut.operand.peek()
        lastOperator = sut.`operator`.peek()
        XCTAssertEqual(lastOperator, nil)
        XCTAssertEqual(lastOperand, "5.0")
    }
}

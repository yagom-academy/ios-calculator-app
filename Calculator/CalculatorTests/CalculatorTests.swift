//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Jinho Choi on 2020/12/15.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    private var systemUnderTest: DecimalCalculator!
    
    override func setUpWithError() throws {
        super.setUp()
        systemUnderTest = DecimalCalculator()
    }

    override func tearDownWithError() throws {
        systemUnderTest = nil
        super.tearDown()
    }
    
    func testAdditionBasicFunction() {
        XCTAssertEqual(systemUnderTest.add(oldOperand: 3, newOperand: 5), 8)
    }
    
    func testSubtractionBasicFunction() {
        XCTAssertEqual(systemUnderTest.subtract(oldOperand: 40, newOperand: 13), 27)
    }
    
    func testMultiplicationBasicFunction() {
        XCTAssertEqual(systemUnderTest.multiply(oldOperand: 2, newOperand: 3), 6)
    }
    
    func testDivisionBasicFunction() {
        XCTAssertEqual(systemUnderTest.divide(oldOperand: 20, newOperand: 2), 10)
    }
    
    func testDivisionAboutZero() {
        XCTAssertEqual(systemUnderTest.divide(oldOperand: 2, newOperand: 0), Double.infinity)
    }
    
    func testPushToOperandStack() {
        systemUnderTest.pushOperandOnStack("3")
        systemUnderTest.pushOperandOnStack("10")
        XCTAssertEqual(systemUnderTest.operand.stack, ["3","10"])
    }
    
    func testPushToOperatorStack() {
        systemUnderTest.pushOperatorOnStack(.addition)
        systemUnderTest.pushOperatorOnStack(.multiplication)
        XCTAssertEqual(systemUnderTest.`operator`.stack, [Calculator.Operator.addition, Calculator.Operator.multiplication])
    }
    
    func testCheckLastOperator() {
        systemUnderTest.pushOperatorOnStack(.addition)
        systemUnderTest.pushOperatorOnStack(.multiplication)
        let expectedValue: Operator = .multiplication
        XCTAssertEqual(systemUnderTest.checkLastOperator(), expectedValue)
    }
    
    func testOperatorStackStateIsInitial() {
        let expectedValue: Operator = .nothing
        XCTAssertEqual(systemUnderTest.checkLastOperator(), expectedValue)
    }
    
    func testIsCalculable() {
        XCTAssertFalse(systemUnderTest.isCalculable())
        systemUnderTest.pushOperandOnStack("30")
        XCTAssertFalse(systemUnderTest.isCalculable())
        systemUnderTest.pushOperandOnStack("10")
        XCTAssertTrue(systemUnderTest.isCalculable())
    }
    
    func testArithmeticAboutReturnType() {
        XCTAssertEqual(systemUnderTest.arithmetic(type: .addition), nil)
        systemUnderTest.pushOperandOnStack("30")
        systemUnderTest.pushOperandOnStack("30")
        XCTAssertEqual(systemUnderTest.arithmetic(type: .addition), 60)
        systemUnderTest.pushOperandOnStack("20.1")
        systemUnderTest.pushOperandOnStack("20")
        XCTAssertEqual(systemUnderTest.arithmetic(type: .addition), 40.1)
    }
    
    func testArithmeticByType() {
        systemUnderTest.pushOperandOnStack("10")
        systemUnderTest.pushOperandOnStack("10")
        XCTAssertEqual(systemUnderTest.arithmetic(type: .addition), 20)
        systemUnderTest.pushOperandOnStack("10")
        systemUnderTest.pushOperandOnStack("10")
        XCTAssertEqual(systemUnderTest.arithmetic(type: .subtraction), 0)
        systemUnderTest.pushOperandOnStack("10")
        systemUnderTest.pushOperandOnStack("10")
        XCTAssertEqual(systemUnderTest.arithmetic(type: .multiplication), 100)
        systemUnderTest.pushOperandOnStack("10")
        systemUnderTest.pushOperandOnStack("10")
        XCTAssertEqual(systemUnderTest.arithmetic(type: .division), 1)
        systemUnderTest.pushOperandOnStack("0")
        systemUnderTest.pushOperandOnStack("10")
        XCTAssertEqual(systemUnderTest.arithmetic(type: .division), 0)
        systemUnderTest.pushOperandOnStack("10")
        systemUnderTest.pushOperandOnStack("0")
        XCTAssertEqual(systemUnderTest.arithmetic(type: .division), Double.infinity)
    }
}

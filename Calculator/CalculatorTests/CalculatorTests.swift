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
}

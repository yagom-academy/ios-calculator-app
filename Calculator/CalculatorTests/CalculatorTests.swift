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
        systemUnderTest = DecimalCalculator()
        super.setUp()
    }

    override func tearDownWithError() throws {
        super.tearDown()
        systemUnderTest = nil
    }
    //Addition subtraction multiplication division
    func testAdditionBasicFunction() {
        XCTAssertEqual(systemUnderTest.add(oldOperand: 3, newOperand: 5), 8)
    }
    
    func testSubtractionBasicFunction() {
        XCTAssertEqual(systemUnderTest.subtract(oldOperand: 40, newOperand: 13), 27)
    }
}

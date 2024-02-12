//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by Jaehun Lee on 2/12/24.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_Add() {
        // Given
        let num1 = 1.234
        let num2 = 5.678
        let expectedValue = 6.912
        
        // When
        let resultValue = try? Operator.add.calculate(lhs: num1, rhs: num2)
        
        // Then
        XCTAssertEqual(expectedValue, resultValue)
    }
    
    func test_Subtract() {
        // Given
        let num1 = 5.678
        let num2 = 1.234
        let expectedValue = 4.444
        
        // When
        let resultValue = try? Operator.subtract.calculate(lhs: num1, rhs: num2)
        
        // Then
        XCTAssertEqual(expectedValue, resultValue)
    }
    
    func test_Divide() {
        // Given
        let num1 = 1.234
        let num2 = 2.0
        let expectedValue = 0.617
        
        // When
        let resultValue = try? Operator.divide.calculate(lhs: num1, rhs: num2)
        
        // Then
        XCTAssertEqual(expectedValue, resultValue)
    }
    
    func test_DivisionByZero() {
        // Given
        let num1 = 100.0
        let num2 = 0.0
        
        // Then
        XCTAssertThrowsError(try Operator.divide.calculate(lhs: num1, rhs: num2))
    }
    
    func test_Multiply() {
        // Given
        let num1 = 3.333
        let num2 = 3.0
        let expectedValue = 9.999
        
        // When
        let resultValue = try? Operator.multiply.calculate(lhs: num1, rhs: num2)
        
        // Then
        XCTAssertEqual(expectedValue, resultValue)
    }
}

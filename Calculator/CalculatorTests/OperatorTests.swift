//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by Danny on 2/20/24.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    var sutAdd: Operator!
    var sutSubtract: Operator!
    var sutDivide: Operator!
    var sutMultiply: Operator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sutAdd = Operator.add
        sutSubtract = Operator.subtract
        sutDivide = Operator.divide
        sutMultiply = Operator.multiply
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sutAdd = nil
        sutSubtract = nil
        sutDivide = nil
        sutMultiply = nil
    }
    
    func test_addOperator_calculate_결과확인() throws {
        // Given
        let lhs: Double = 1
        let rhs: Double = 1
        
        // When
        let expectation: Double = 2
        let result = sutAdd.calculate(lhs: lhs, rhs: rhs)
        
        // Then
        XCTAssertEqual(expectation, result)
    }
    
    func test_subtractOperator_calculate_결과확인() throws {
        // Given
        let lhs: Double = 1
        let rhs: Double = 3
        
        // When
        let expectation: Double = -2
        let result = sutSubtract.calculate(lhs: lhs, rhs: rhs)
        
        // Then
        XCTAssertEqual(expectation, result)
    }
    
    func test_divideOperator_calculate_결과확인() throws {
        // Given
        let lhs: Double = 3
        let rhs: Double = 3
        
        // When
        let expectation: Double = 1
        let result = sutDivide.calculate(lhs: lhs, rhs: rhs)
        
        // Then
        XCTAssertEqual(expectation, result)
    }
    
    func test_multiplyOperator_calculate_결과확인() throws {
        // Given
        let lhs: Double = 3
        let rhs: Double = 3
        
        // When
        let expectation: Double = 9
        let result = sutMultiply.calculate(lhs: lhs, rhs: rhs)
        
        // Then
        XCTAssertEqual(expectation, result)
    }
}

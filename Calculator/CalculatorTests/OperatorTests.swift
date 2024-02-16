//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by Danny on 2/16/24.
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
        let lhs: Double = 1
        let rhs: Double = 1
        let expectation: Double = 2
        
        let result = try sutAdd.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_subtractOperator_calculate_결과확인() throws {
        let lhs: Double = 1
        let rhs: Double = 3
        let expectation: Double = -2
        
        let result = try sutSubtract.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_divideOperator_calculate_결과확인() throws {
        let lhs: Double = 3
        let rhs: Double = 3
        let expectation: Double = 1
        
        let result = try sutDivide.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(expectation, result)
    }
    
    func test_multiplyOperator_calculate_결과확인() throws {
        let lhs: Double = 3
        let rhs: Double = 3
        let expectation: Double = 9
        
        let result = try sutMultiply.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(expectation, result)
    }
    
}

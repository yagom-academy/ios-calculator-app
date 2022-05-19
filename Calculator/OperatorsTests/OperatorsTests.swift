//
//  OperatorsTests.swift
//  OperatorsTests
//
//  Created by NAMU on 2022/05/19.
//

import XCTest
@testable import Calculator

class OperatorsTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_calculate_case가_add일때_더하기를하는지() {
        // given
        let one = 1.0
        let two = 2.0
        
        // when
        let result = Operator.add.calculate(lhs: one, rhs: two)
        
        // then
        XCTAssertEqual(result, 3.0)
    }
    
    func test_calculate_case가_substract일때_빼기를하는지() {
        // given
        let one = 1.0
        let two = 2.0
        
        // when
        let result = Operator.subtract.calculate(lhs: one, rhs: two)
        
        // then
        XCTAssertEqual(result, -1.0)
    }
    
    func test_calculate_case가_didvide일때_나누기를하는지() {
        // given
        let one = 1.0
        let two = 2.0
        
        // when
        let result = Operator.divide.calculate(lhs: one, rhs: two)
        
        // then
        XCTAssertEqual(result, 0.5)
    }
    
    func test_calculate_case가_multiply일때_곱하기를하는지() {
        // given
        let one = 1.0
        let two = 2.0
        
        // when
        let result = Operator.multiply.calculate(lhs: one, rhs: two)
        
        // then
        XCTAssertEqual(result, 2.0)
    }
    
}

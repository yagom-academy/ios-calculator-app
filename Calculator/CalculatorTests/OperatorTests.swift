//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by dragon on 2022/09/24.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    var sut: Operator!

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_add일때_lhs_rhs_숫자를_입력하면_덧셈값이_나와야함() throws {
        // Given
        sut = Operator(rawValue: "+")
        
        // When
        let result = try sut.calculate(lhs: 20, rhs: 2)
        
        // Then
        XCTAssertEqual(result, 22)
    }
    
    func test_subtract일때_lhs_rhs_숫자를_입력하면_뺄셈값이_나와야함() throws {
        // Given
        sut = Operator(rawValue: "-")
        
        // When
        let result = try sut.calculate(lhs: 2.5, rhs: 20)
        
        // Then
        XCTAssertEqual(result, -17.5)
    }
    
    func test_multiply일때_lhs_rhs_숫자를_입력하면_곰셈값이_나와야함() throws {
        // Given
        sut = Operator(rawValue: "*")
        
        // When
        let result = try sut.calculate(lhs: 10.5, rhs: 10.5)
        
        // Then
        XCTAssertEqual(result, 110.25)
    }
    
    func test_divide일때_lhs_rhs_숫자를_입력하면_나눗셈값이_나와야함() throws {
        // Given
        sut = Operator(rawValue: "/")
        
        // When
        let result = try sut.calculate(lhs: 20, rhs: 50)
        
        // Then
        XCTAssertEqual(result, 0.4)
    }
}

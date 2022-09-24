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

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_lhs20_rhs2_숫자가입력되었을때_덧셈값이_22_나와야함() throws {
        // Given
        sut = Operator(rawValue: "+")
        
        // When
        let result = sut.calculate(lhs: 20, rhs: 2)
        
        // Then
        XCTAssertEqual(result, 22)
    }
    
    func test_lhs2점5_rhs20_숫자가입력되었을때_뺄셈값이_마이너스17점5_나와야함() throws {
        // Given
        sut = Operator(rawValue: "-")
        
        // When
        let result = sut.calculate(lhs: 2.5, rhs: 20)
        
        // Then
        XCTAssertEqual(result, -17.5)
    }
    
    func test_lhs10점5_rhs10점5_숫자가입력되었을때_곱셈값이_110점25_나와야함() throws {
        // Given
        sut = Operator(rawValue: "*")
        
        // When
        let result = sut.calculate(lhs: 10.5, rhs: 10.5)
        
        // Then
        XCTAssertEqual(result, 110.25)
    }
    
    func test_lhs20_rhs50_숫자가입력되었을때_나눗셈값이_0점4_나와야함() throws {
        // Given
        sut = Operator(rawValue: "/")
        
        // When
        let result = sut.calculate(lhs: 20, rhs: 50)
        
        // Then
        XCTAssertEqual(result, 0.4)
    }
}

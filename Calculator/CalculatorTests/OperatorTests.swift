//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Hisop on 2023/10/11.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    var sut: Operator!
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_operator가_add일때_1_2전달하며_calculate호출시_반환값이3인지() throws {
        sut = .add
        let lhs: Double = 1
        let rhs: Double = 2
        let expectation: Double = 3
        
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(result, expectation)
    }

    func test_operator가_subtract일때_10_5전달하며_calculate호출시_반환값이_5인지() throws {
        sut = .subtract
        let lhs: Double = 10
        let rhs: Double = 5
        let expectation: Double = 5
        
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_operator가_divide일때_10_5전달하며_calculate호출시_반환값이_2인지() throws {
        sut = .divide
        let lhs: Double = 10
        let rhs: Double = 5
        let expectation: Double = 2
        
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(result, expectation)
    }

    func test_operator가_multiply일때_10_5전달하며_calculate호출시_반환값이_50인지() throws {
        sut = .multiply
        let lhs: Double = 10
        let rhs: Double = 5
        let expectation: Double = 50
        
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(result, expectation)
    }
}

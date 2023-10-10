//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by 김진주 on 10/10/23.
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

    func test_operator가add일때_calculator호출시_1과2를더해서결과는3이다() throws {
        // given
        sut = Operator.add
        let lhs = 1.0
        let rhs = 2.0
        let expectation = 3.0
        
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operator가subract일때_calculator호출시_1과2를빼서결과는마이너스1이다() throws {
        // given
        sut = Operator.subtract
        let lhs = 1.0
        let rhs = 2.0
        let expectation = -1.0
        
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operator가divide일때_calculator호출시_1과2를나누어서결과는0점5이다() throws {
        // given
        sut = Operator.divide
        let lhs = 1.0
        let rhs = 2.0
        let expectation = 0.5
        
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operator가divide일때_calculator호출시_1과0을나누어서canNotDivideZero에러를던진다() {
        // given
        sut = Operator.divide
        let lhs = 1.0
        let rhs = 0.0
        
        //when then
        XCTAssertThrowsError(try sut.calculate(lhs: lhs, rhs: rhs)) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.canNotDivideZero)
        }
    }
    
    func test_operator가multiply일때_calculator호출시_1과2를곱해서결과는2이다() throws {
        // given
        sut = Operator.multiply
        let lhs = 1.0
        let rhs = 2.0
        let expectation = 2.0
        
        //when
        let result = try sut.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, expectation)
    }
}

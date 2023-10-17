//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by jyubong,Morgan.
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

    func test_calculator호출시_operator가add일때_1과2를더해서결과는3이다() {
        // given
        sut = Operator.add
        let lhs = 1.0
        let rhs = 2.0
        let expectation = 3.0
        
        //when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculator호출시_operator가subract일때_1과2를빼서결과는마이너스1이다() {
        // given
        sut = Operator.subtract
        let lhs = 1.0
        let rhs = 2.0
        let expectation = -1.0
        
        //when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculator호출시_operator가divide일때_1과2를나누어서결과는0점5이다() {
        // given
        sut = Operator.divide
        let lhs = 1.0
        let rhs = 2.0
        let expectation = 0.5
        
        //when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculator호출시_operator가divide일때_1과0을나누면nan이다() {
        // given
        sut = Operator.divide
        let lhs = 1.0
        let rhs = 0.0
        
        // when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertTrue(result.isNaN)
    }
    
    func test_calculator호출시_operator가multiply일때_1과2를곱해서결과는2이다() {
        // given
        sut = Operator.multiply
        let lhs = 1.0
        let rhs = 2.0
        let expectation = 2.0
        
        //when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, expectation)
    }
}

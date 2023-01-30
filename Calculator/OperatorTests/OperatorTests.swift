//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Christy Lee on 2023/01/30.
//

import XCTest

final class OperatorTests: XCTestCase {
    var sut: Operator!

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_lhs는1_rhs는2일때_add호출시_3을_반환한다() {
        // given
        let lhs = 1.0
        let rhs = 2.0
        let expectation = 3.0
        sut = Operator.add
        
        // when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_lhs는3_rhs는2일때_subtract호출시_1을_반환한다() {
        // given
        let lhs = 3.0
        let rhs = 2.0
        let expectation = 1.0
        sut = Operator.subtract
        
        // when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_lhs는1_rhs는2일때_subtract호출시_음수1를_반환한다() {
        // given
        let lhs = 1.0
        let rhs = 2.0
        let expectation = -1.0
        sut = Operator.subtract
        
        // when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_rhs가_0일때_divide호출시_nan을_반환한다() {
        // given
        let lhs = 10.0
        let rhs = 0.0
        sut = Operator.divide
        
        // when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertTrue(result.isNaN)
    }
    
    func test_lhs는1_rhs는2일때_multiply호출시_2를_반환한다() {
        // given
        let lhs = 1.0
        let rhs = 2.0
        let expectation = 2.0
        sut = Operator.multiply
        
        // when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_lhs는1_rhs는_음수2일때_multiply호출시_음수2를_반환한다() {
        // given
        let lhs = 1.0
        let rhs = -2.0
        let expectation = -2.0
        sut = Operator.multiply
        
        // when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_lhs는음수1_rhs는_음수2일때_multiply호출시_2를_반환한다() {
        // given
        let lhs = -1.0
        let rhs = -2.0
        let expectation = 2.0
        sut = Operator.multiply
        
        // when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_lhs는0_rhs는2일때_multiply호출시_0을_반환한다() {
        // given
        let lhs = 0.0
        let rhs = 2.0
        let expectation = 0.0
        sut = Operator.multiply
        
        // when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertEqual(result, expectation)
    }
}

//  CalculatorItemQueueTests - OperatorTests.swift
//  created by vetto on 2023/01/28

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
    
    func test_sut에_add를_넣고_lhs는_3_rhs는_4를_넣고_calculate를_호출하면_결과값은_7이_반환된다() {
        // given
        let lhs: Double = 3
        let rhs: Double = 4
        sut = Operator(rawValue: "+")
        
        // when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        let expecatation: Double = 7
        
        // then
        XCTAssertEqual(result, expecatation)
    }
    
    func test_sut에_subtract를_넣고_lhs는_10_rhs는_15를_넣고_calculate를_호출하면_결과값은_마이너스5가_반환된다() {
        // given
        let lhs: Double = 10
        let rhs: Double = 15
        sut = Operator(rawValue: "-")
        
        // when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        let expecatation: Double = -5
        
        // then
        XCTAssertEqual(result, expecatation)
    }
    
    func test_sut에_multiply를_넣고_lhs는_22_rhs는_5를_넣고_calculate를_호출하면_결과값은_110이_반환된다() {
        // given
        let lhs: Double = 22
        let rhs: Double = 5
        sut = Operator(rawValue: "*")
        
        // when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        let expecatation: Double = 110
        
        // then
        XCTAssertEqual(result, expecatation)
    }
    
    func test_sut에_divide를_넣고_lhs는_21_rhs는_7을_넣고_calculate를_호출하면_결과값은_3이_반환된다() {
        // given
        let lhs: Double = 21
        let rhs: Double = 7
        sut = Operator(rawValue: "/")
        
        // when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        let expecatation: Double = 3
        
        // then
        XCTAssertEqual(result, expecatation)
    }
    
    func test_sut에_divide를_넣고_calculate를_호출할_때_rhs가_0이면_결과값은_nan이_반환된다() {
        // given
        let lhs: Double = 9
        let rhs: Double = 0
        sut = Operator(rawValue: "/")
        
        // when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertTrue(result.isNaN)
    }
}

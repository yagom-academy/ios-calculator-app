//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by kimseongjun on 2023/01/27.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {

    var sut: Operator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Operator.add
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_add메서드에서_3과4를넣었을때_결과값이7이나온다() {
        //given
        let inputlhs: Double = 3
        let inputrhs: Double = 4
        let expectationValue: Double = 7
        sut = Operator.add
        
        //when
        let result = sut.calculate(lhs: inputlhs, rhs: inputrhs)
        
        //then
        XCTAssertEqual(result, expectationValue)
    }
    
    func test_subtract메서드에서_4와1를넣었을때_결과값이3이나온다() {
        //given
        let inputlhs: Double = 4
        let inputrhs: Double = 1
        let expectationValue: Double = 3
        sut = Operator.subtract
        
        //when
        let result = sut.calculate(lhs: inputlhs, rhs: inputrhs)
        
        //then
        XCTAssertEqual(result, expectationValue)
    }
    
    func test_multiply메서드에서_3과4를넣었을때_결과값이12이나온다() {
        //given
        let inputlhs: Double = 3
        let inputrhs: Double = 4
        let expectationValue: Double = 12
        sut = Operator.multiply
        
        //when
        let result = sut.calculate(lhs: inputlhs, rhs: inputrhs)
        
        //then
        XCTAssertEqual(result, expectationValue)
    }
    
    func test_divide메서드에서_1와2를넣었을때_결과값이0_5이나온다() {
        //given
        let inputlhs: Double = 1
        let inputrhs: Double = 2
        let expectationValue: Double = 0.5
        sut = Operator.divide
        
        //when
        let result = sut.calculate(lhs: inputlhs, rhs: inputrhs)
        
        //then
        XCTAssertEqual(result, expectationValue)
    }

    func test_divide메서드실행시_rhs가0일경우_nan을반환한다() {
        //given
        let inputlhs: Double = 1
        let inputrhs: Double = 0
        sut = Operator.divide
        
        //when
        let result = sut.calculate(lhs: inputlhs, rhs: inputrhs)
        
        //then
        XCTAssertTrue(result.isNaN)
    }
    
}

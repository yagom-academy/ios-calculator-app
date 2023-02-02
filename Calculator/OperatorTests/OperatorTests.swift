//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Andrew on 2023/02/01.
//

import XCTest

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
    
    func test_1더하기2는_3의값을_확인하는함수() {
        // given
        let firstNumber: Double = 1
        let secondNumber: Double = 2
        sut = Operator.add
        let expectedValue: Double = 3
        
        // when
        let addResult = sut.calculate(lhs: firstNumber, rhs: secondNumber)
        
        // then
        XCTAssertEqual(expectedValue, addResult)
    }
    
    func test_1빼기2는_마이너스1값을_확인하는함수() {
        // given
        let firstNumber: Double = 1
        let secondNumber: Double = 2
        sut = Operator.subtract
        let expectedValue: Double = -1
        
        // when
        let subtractResult = sut.calculate(lhs: firstNumber, rhs: secondNumber)
        
        // then
        XCTAssertEqual(expectedValue, subtractResult)
    }
    
    func test_1곱하기2는_2값을_확인하는함수() {
        // given
        let firstNumber: Double = 1
        let secondNumber: Double = 2
        sut = Operator.multiply
        let expectedValue: Double = 2
        
        // when
        let multiplyResult = sut.calculate(lhs: firstNumber, rhs: secondNumber)
        
        // then
        XCTAssertEqual(expectedValue, multiplyResult)
    }
    
    func test_1나누기2는_0점5값을_확인하는함수() {
        // given
        let firstNumber: Double = 1
        let secondNumber: Double = 2
        sut = Operator.divide
        let expectedValue: Double = 0.5
        
        // when
        let divideResult = sut.calculate(lhs: firstNumber, rhs: secondNumber)
        
        // then
        XCTAssertEqual(expectedValue, divideResult)
    }
    
    func test_0으로나누기를시도하면_NaN값을_확인하는함수() {
        // given
        let firstNumber: Double = 2
        let secondNumber: Double = 0
        sut = Operator.divide
        
        // when
        let nan = sut.calculate(lhs: firstNumber, rhs: secondNumber)
        
        // then
         XCTAssertTrue(nan.isNaN)
    }
}

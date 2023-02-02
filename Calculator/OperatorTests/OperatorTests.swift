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
        sut = Operator.subtract
        sut = Operator.multiply
        sut = Operator.divide
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_1더하기2는3() {
        // given
        let number1: Double = 1
        let number2: Double = 2
        sut = Operator.add
        let result: Double = 3
        
        // when
        let add = sut.calculate(lhs: number1, rhs: number2)
        
        // then
        XCTAssertEqual(result, add)
    }
    
    func test_1빼기2는_마이너스1() {
        // given
        let number1: Double = 1
        let number2: Double = 2
        sut = Operator.subtract
        let result: Double = -1
        
        // when
        let subtract = sut.calculate(lhs: number1, rhs: number2)
        
        // then
        XCTAssertEqual(result, subtract)
    }
    
    func test_1곱하기2는_2() {
        // given
        let number1: Double = 1
        let number2: Double = 2
        sut = Operator.multiply
        let result: Double = 2
        
        // when
        let multiply = sut.calculate(lhs: number1, rhs: number2)
        
        // then
        XCTAssertEqual(result, multiply)
    }
    
    func test_1나누기2는_0점5() {
        // given
        let number1: Double = 1
        let number2: Double = 2
        sut = Operator.divide
        let result: Double = 0.5
        
        // when
        let divide = sut.calculate(lhs: number1, rhs: number2)
        
        // then
        XCTAssertEqual(result, divide)
    }
    
    func test_0으로나누기를시도하면_NaN() {
        // given
        let number1: Double = 2
        let number2: Double = 0
        sut = Operator.divide
        
        // when
        let nan = sut.calculate(lhs: number1, rhs: number2)
        
        // then
         XCTAssertTrue(nan.isNaN)
    }
}

//
//  OperatorTest.swift
//  OperatorTest
//
//  Created by 천승현 on 2023/01/27.
//

import XCTest

final class OperatorTest: XCTestCase {
    
    var sut: Operator!

    override func setUpWithError() throws {
        sut = Operator.add
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_add호출시_피연산자가_2와_5이면_7을반환한다() {
        // given
        let operand1 = 2.0
        let operand2 = 5.0
        sut = Operator.add
        let expectaiton = 7.0
        
        // when
        let result = sut.calculate(lhs: operand1, rhs: operand2)
        
        // then
        XCTAssertEqual(result, expectaiton)
    }
    
    func test_add호출시_피연산자가_음수2와_음수5라면_음수7을반환한다() {
        // given
        let operand1 = -2.0
        let operand2 = -5.0
        sut = Operator.add
        let expectaiton = -7.0
        
        // when
        let result = sut.calculate(lhs: operand1, rhs: operand2)
        
        // then
        XCTAssertEqual(result, expectaiton)
    }
    
    func test_subtract호출시_피연산자가_5와_3이라면_2를반환한다() {
        // given
        let operand1 = 5.0
        let operand2 = 3.0
        sut = Operator.subtract
        let expectation = 2.0
        
        // when
        let result = sut.calculate(lhs: operand1, rhs: operand2)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_subtract호출시_피연산자가_2와_음수2라면_4를반환한다() {
        // given
        let operand1 = 2.0
        let operand2 = -2.0
        sut = Operator.subtract
        let expectation = 4.0
        
        // when
        let result = sut.calculate(lhs: operand1, rhs: operand2)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_subtract호출시_피연산자가_음수2와_음수2_라면_0을반환한다() {
        // given
        let operand1 = -2.0
        let operand2 = -2.0
        sut = Operator.subtract
        let expectation = 0.0
        
        // when
        let result = sut.calculate(lhs: operand1, rhs: operand2)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_divide호출시_피연산자가_3과_1이라면_3을반환한다() {
        // given
        let operand1 = 3.0
        let operand2 = 1.0
        sut = Operator.divide
        let expectation = 3.0
        
        // when
        let result = sut.calculate(lhs: operand1, rhs: operand2)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_divide호출시_피연산자가_3과_0이라면_NaN을반환한다() {
        // given
        let operand1 = 3.0
        let operand2 = 0.0
        sut = Operator.divide
        
        // when
        let result = sut.calculate(lhs: operand1, rhs: operand2)
        
        // then
        XCTAssertTrue(result.isNaN)
    }
    
    func test_divide호출시_피연산자가_1과_2라면_소수점을반환한다() {
        // given
        let operand1 = 1.0
        let operand2 = 2.0
        sut = Operator.divide
        let expectation = 0.5
        
        // when
        let result = sut.calculate(lhs: operand1, rhs: operand2)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_multiply호출시_피연산자가_2와_4라면_8을반환한다() {
        // given
        let operand1 = 2.0
        let operand2 = 4.0
        sut = Operator.multiply
        let expectation = 8.0
        
        // when
        let result = sut.calculate(lhs: operand1, rhs: operand2)
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_multiply호출시_피연산자가_음수2와_음수4라면_8을반환한다() {
        // given
        let operand1 = -2.0
        let operand2 = -4.0
        sut = Operator.multiply
        let expectation = 8.0
        
        // when
        let result = sut.calculate(lhs: operand1, rhs: operand2)
        
        // then
        XCTAssertEqual(result, expectation)
    }
}

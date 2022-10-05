//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by 이정민 on 2022/09/23.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    var sut: Operator!

    func test_when_given_1_2_add_then_return_3() {
        // given
        sut = .add
        let number1 = 1.0
        let number2 = 2.0
        
        // when
        let result = try? sut.calculate(lhs: number1, rhs: number2)
        
        // then
        XCTAssertEqual(result, number1 + number2)

    }
    
    func test_when_given_1_2_subtract_then_return_minus_1() {
        // given
        sut = .subtract
        let number1 = 1.0
        let number2 = 2.0
        
        // when
        let result = try? sut.calculate(lhs: number1, rhs: number2)
        
        // then
        XCTAssertEqual(result, number1 - number2)
        
    }
    
    func test_when_given_4_2_divide_then_return_2() {
        // given
        sut = .divide
        let number1 = 4.0
        let number2 = 2.0
        
        // when
        let result = try? sut.calculate(lhs: number1, rhs: number2)
        
        // then
        XCTAssertEqual(result, number1 / number2)
    }
    
    func test_when_given_3_6_multiply_then_return_18() {
        // given
        sut = .multiply
        let number1 = 3.0
        let number2 = 6.0
        
        // when
        let result = try? sut.calculate(lhs: number1, rhs: number2)
        
        // then
        XCTAssertEqual(result, number1 * number2)
    }
    
}

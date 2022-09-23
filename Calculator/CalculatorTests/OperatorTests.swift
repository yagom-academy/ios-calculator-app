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

    func test_Given_1_2_add_Then_return_3() {
        // given
        sut = .add
        let number_1 = 1.0
        let number_2 = 2.0
        
        // when
        let result = try? sut.calculate(lhs: number_1, rhs: number_2)
        
        // then
        XCTAssertEqual(result, number_1 + number_2)

    }
    
    func test_Given_1_2_subtract_Then_return_minus_1() {
        // given
        sut = .subtract
        let number_1 = 1.0
        let number_2 = 2.0
        
        // when
        let result = try? sut.calculate(lhs: number_1, rhs: number_2)
        
        // then
        XCTAssertEqual(result, number_1 - number_2)
        
    }
    
    func test_Given_4_2_divide_Then_return_2() {
        // given
        sut = .divide
        let number_1 = 4.0
        let number_2 = 2.0
        
        // when
        let result = try? sut.calculate(lhs: number_1, rhs: number_2)
        
        // then
        XCTAssertEqual(result, number_1 / number_2)
    }
    
    func test_Given_3_6_multiply_Then_return_18() {
        // given
        sut = .multiply
        let number_1 = 3.0
        let number_2 = 6.0
        
        // when
        let result = try? sut.calculate(lhs: number_1, rhs: number_2)
        
        // then
        XCTAssertEqual(result, number_1 * number_2)
    }
    
}

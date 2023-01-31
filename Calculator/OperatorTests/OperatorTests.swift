//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by jiye Yi on 2023/01/27.
//

import XCTest
@testable import Calculator
final class OperatorTests: XCTestCase {

    func test_add_를실행하면_두개의값을더한값이_반환된다() throws {
        //given
        let lhs: Double = 12.5
        let rhs: Double = 12.5
        let expectation: Double = 25

        //when
        let result = try Operator.add.calculate(lhs: lhs, rhs: rhs)

        //then
        XCTAssertEqual(result, expectation)
    }

    func test_subtract_를실행하면_첫번째값에서_두번째값을뺀값이_반환된다() throws {
        //given
        let lhs: Double = 25.0
        let rhs: Double = 12.5
        let expectation: Double = 12.5

        //when
        let result = try Operator.subtract.calculate(lhs: lhs, rhs: rhs)

        //then
        XCTAssertEqual(result, expectation)
    }
   
    func test_divide_를실행하면_첫번째값에서_두번째값을나눈값이_반환된다() throws {
        //given
        let lhs: Double = 25.0
        let rhs: Double = 5.0
        let expectation: Double = 5

        //when
        let result = try Operator.divide.calculate(lhs: lhs, rhs: rhs)

        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_divide_두번째값이_0이라면_오류를던진다() throws {
        //given
        let lhs: Double = 5.0
        let rhs: Double = 0
        
        //then
        XCTAssertThrowsError(try Operator.divide.calculate(lhs: lhs, rhs: rhs)) { error in
            
            XCTAssertEqual(error as? CalculatorError, CalculatorError.divideByZero)
        }
    }
    
    func test_multiply_를실행하면_첫번째값에서_두번째값을곱한값이_반환된다() throws {
        //given
        let lhs: Double = 5.5
        let rhs: Double = 3.75
        let expectation: Double = 20.625

        //when
        let result = try Operator.multiply.calculate(lhs: lhs, rhs: rhs)

        //then
        XCTAssertEqual(result, expectation)
    }
    
}

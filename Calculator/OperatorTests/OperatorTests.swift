//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by jiye Yi on 2023/01/27.
//

import XCTest
@testable import Calculator
final class OperatorTests: XCTestCase {

    override func setUpWithError() throws {
       
    }

    override func tearDownWithError() throws {
    
    }

    func test_calculate_add_를실행하면_두개의값을더한값이_반환된다() {
        //given
        let lhs: Double = 12.5
        let rhs: Double = 12.5
        let expectation: Double = 25
        
        //when
        let result = Operator.add.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculate_subtract_를실행하면_첫번째값에서_두번째값을뺀값이_반환된다() {
        //given
        let lhs: Double = 25.0
        let rhs: Double = 12.5
        let expectation: Double = 12.5
        
        //when
        let result = Operator.subtract.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, expectation)
    }
   
    func test_calculate_divide_를실행하면_첫번째값에서_두번째값을나눈값이_반환된다() {
        //given
        let lhs: Double = 25.0
        let rhs: Double = 5.0
        let expectation: Double = 5
        
        //when
        let result = Operator.divide.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_calculate_multiply_를실행하면_첫번째값에서_두번째값을곱한값이_반환된다() {
        //given
        let lhs: Double = 5.5
        let rhs: Double = 3.75
        let expectation: Double = 20.625
        
        //when
        let result = Operator.multiply.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, expectation)
    }
}

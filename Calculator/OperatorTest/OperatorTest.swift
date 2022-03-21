//
//  OperatorTest.swift
//  OperatorTest
//
//  Created by DuDu on 2022/03/18.
//

import XCTest
@testable import Calculator

class OperatorTest: XCTestCase {
    var sut: Operator?

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_두수를_add_Operator로_연산했을때_더하기가_수행되어야한다() {
        //given
        sut = .add
        
        //when
        let result = try? sut?.calculate(lhs: 3, rhs: 4)
        
        //then
        XCTAssertEqual(result, 7)
    }
    
    func test_두수를_subtract_Operator로_연산했을때_빼기가_수행되어야한다() {
        //given
        sut = .subtract
        
        //when
        let result = try? sut?.calculate(lhs: 4, rhs: 3)
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_두수를_multiply_Operator로_연산했을때_곱하기_수행되어야한다() {
        //given
        sut = .multiply
        
        //when
        let result = try? sut?.calculate(lhs: 4, rhs: 3)
        
        //then
        XCTAssertEqual(result, 12)
    }
    
    func test_두수를_divide_Operator로_연산했을때_나누기가_수행되어야한다() {
        //given
        sut = .divide
        
        //when
        let result = try? sut?.calculate(lhs: 10, rhs: 2)
        
        //then
        XCTAssertEqual(result, 5)
    }
    
    func test_두수를_divide_Operator로_연산했을때_나누는수가_0이라면_CalculateError_divideByZero가_발생해야한다() {
        //given
        sut = .divide
        
        //when, then
        XCTAssertThrowsError(try sut?.calculate(lhs: 10, rhs: 0), "divideByZero") { error in
            XCTAssertEqual(error as? CalculateError, CalculateError.divideByZero)
        }
    }
}

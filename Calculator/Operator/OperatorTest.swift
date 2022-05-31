//
//  Operator.swift
//  Operator
//
//  Created by Kiwi, Wongbing on 2022/05/19.
//

import XCTest
@testable import Calculator
class OperatorTest: XCTestCase {
    var sut: Operator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_두수를_add로_연산했을때_더하기가_되어야한다() {
        //given
        sut = .add
        
        //when
        let result = try? sut.calculate(lhs: 1, rhs: 2)
        
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_두수를_subtract로_연산했을때_빼기가_되어야한다() {
        //given
        sut = .substract
        
        //when
        let result = try? sut.calculate(lhs: 2, rhs: 1)
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_두수를_multiply로_연산했을때_곱하기_되어야한다() {
        //given
        sut = .multiply
        
        //when
        let result = try? sut.calculate(lhs: 2, rhs: 3)
        
        //then
        XCTAssertEqual(result, 6)
    }
    
    func test_두수를_divide로_연산했을때_나누기가_되어야한다() {
        //given
        sut = .divide
        
        //when
        let result = try? sut.calculate(lhs: 4, rhs: 2)
        
        //then
        XCTAssertEqual(result, 2)
    }
    func test_0으로_divide_했을때_Error가_호출되어야한다() {
        //given
        sut = .divide
        //when,then
        XCTAssertThrowsError(try sut.calculate(lhs: 2, rhs: 0), "divideByZero") { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.divideZero)
        }
    }
}

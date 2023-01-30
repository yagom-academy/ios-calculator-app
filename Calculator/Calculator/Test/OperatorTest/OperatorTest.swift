//
//  OperatorTest.swift
//  OperatorTest
//
//  Created by 김성준 on 2023/01/27.
//

import XCTest

final class OperatorTest: XCTestCase {

    override func setUpWithError() throws {
     
    }

    override func tearDownWithError() throws {
        
    }

    func test_operator가_add일때_calculate를_실행할시_덧셈의연산을한다() {
        //give
        let a = 10.0
        let b = 5.0
        let operators = Operator.add
        
        //when
        let result = operators.calculate(lhs: a, rhs: b)
        let expectation = 15.0
       
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operator가_subtract일때_calculate를_실행할시_뺄셈의연산을한다() {
        //give
        let a = 10.0
        let b = 5.0
        let operators = Operator.subtract
        
        //when
        let result = operators.calculate(lhs: a, rhs: b)
        let expectation = 5.0
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operator가_divide일때_calculate를_실행할시_나눗셈의연산을한다() {
        //give
        let a = 10.0
        let b = 5.0
        let operators = Operator.divide
        
        //when
        let result = operators.calculate(lhs: a, rhs: b)
        let expectation = 2.0
  
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_operator가_divide일때_rightValue가_0일시_Nan을반환한다() {
        //give
        let a = 10.0
        let b = Double.zero
        let operators = Operator.divide
        
        //when
        let result = operators.calculate(lhs: a, rhs: b)
  
        //then
        XCTAssertTrue(result.isNaN)
    }
    
    func test_operator가_multiply일때_calculate를_실행할시_곱셈의연산을한다() {
        //give
        let a = 10.0
        let b = 5.0
        let operators = Operator.multiply
        
        //when
        let result = operators.calculate(lhs: a, rhs: b)
        let expectation = 50.0
   
        //then
        XCTAssertEqual(result, expectation)
    }

}

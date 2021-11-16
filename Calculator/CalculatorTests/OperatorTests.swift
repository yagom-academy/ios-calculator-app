//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by 양호준 on 2021/11/11.
//

import XCTest

class OperatorTests: XCTestCase {
    func test_더하기일때_덧셈이_잘_계산되는지() {
        let value = Operator.calculate(.add)(lhs: 2, rhs: 4)
        
        XCTAssertEqual(value, 6.0)
    }
    
    func test_더하기일때_음수가_있어도_덧셈이_잘_계산되는지() {
        let value = Operator.calculate(.add)(lhs: -2, rhs: 7)
        
        XCTAssertEqual(value, 5)
    }
    
    func test_소수의_덧셈도_잘_계산되는지() {
        let value = Operator.calculate(.add)(lhs: 5.5, rhs: 4.5)
        
        XCTAssertEqual(value, 10)
    }
    
    func test_소수_간의_덧셈도_잘_계산되는지() {
        let value = Operator.calculate(.add)(lhs: 0.5, rhs: 0.3)
        
        XCTAssertEqual(value, 0.8)
    }
    
    func test_빼기일때_뺄셈이_잘_계산되는지() {
        let value = Operator.calculate(.subtract)(lhs: 7, rhs: 2)
        
        XCTAssertEqual(value, 5)
    }
    
    func test_빼기일때_음수가_있어도_뺄셈이_잘_계산되는지() {
        let value = Operator.calculate(.subtract)(lhs: -2, rhs: 5)
        
        XCTAssertEqual(value, -7)
    }
    
    func test_소수의_뺄셈도_잘_계산되는지() {
        let value = Operator.calculate(.subtract)(lhs: 5.5, rhs: 4.5)
        
        XCTAssertEqual(value, 1)
    }
    
    func test_나누기일때_나눗셈이_잘_계산되는지() {
        let value = Operator.calculate(.divide)(lhs: 10, rhs: 5)
        
        XCTAssertEqual(value, 2)
    }
    
    func test_소수의_나눗셈도_잘_계산되는지() {
        let value = Operator.calculate(.divide)(lhs: 5.5, rhs: 5.5)
        
        XCTAssertEqual(value, 1)
    }
    
    func test_나누기일때_결과가_소수인_나눗셈도_잘_계산되는지() {
        let value = Operator.calculate(.divide)(lhs: 5, rhs: 10)
        
        XCTAssertEqual(value, 0.5)
    }
    
    func test_곱하기일때_곱셈이_잘_계산되는지() {
        let value = Operator.calculate(.multiply)(lhs: 2, rhs: 5)
        
        XCTAssertEqual(value, 10)
    }
    
    func test_소수의_곱셈도_잘_계산되는지() {
        let value = Operator.calculate(.multiply)(lhs: 5, rhs: 0.5)
        
        XCTAssertEqual(value, 2.5)
    }
    
    func test_0으로_나눌_때_오류를_잘_던지는지() {
        let value = Operator.calculate(.divide)(lhs: 5, rhs: 0)
        
        XCTAssertTrue(value.isNaN)
    }
}

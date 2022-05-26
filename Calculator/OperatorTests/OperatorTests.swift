//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Minseong Kang on 2022/05/27.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    
    // MARK: - Properties
    
    let num1 = 2.0
    let num2 = 5.0
    

    // MARK: - calculate(lhs:rhs:)를 통한 사칙연산 메서드의 테스트
    
    func test_calulate메서드를_통한_add메서드_두_파라미터의_합을_리턴() {
        // when
        let result = Operator.add.calculate(lhs: num1, rhs: num2)
        
        // then
        XCTAssertEqual(result, num1 + num2)
    }
    
    func test_calulate메서드를_통한_subtract메서드_두_파라미터의_차를_리턴() {
        // when
        let result = Operator.subtract.calculate(lhs: num1, rhs: num2)
        
        // then
        XCTAssertEqual(result, num1 - num2)
    }
    
    func test_calulate메서드를_통한_divide메서드_좌항을_우항으로_나눈_값을_리턴() {
        // when
        let result = Operator.divide.calculate(lhs: num1, rhs: num2)
        
        // then
        XCTAssertEqual(result, num1 / num2)
    }
    
    func test_calulate메서드를_통한_multiply메서드_두_파라미터의_곱을_리턴() {
        // when
        let result = Operator.multiply.calculate(lhs: num1, rhs: num2)
        
        // then
        XCTAssertEqual(result, num1 * num2)
    }

}

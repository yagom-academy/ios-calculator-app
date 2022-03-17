//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by Lingo on 2022/03/17.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
  
  func test_Operator가_add일때_2_1는_3을_반환해야한다() {
    // given
    let input = Operator.add
    // when
    let output = input.calculate(lhs: 2.0, rhs: 1.0)
    // then
    XCTAssertEqual(output, 3.0)
  }
    
  func test_Operator가_subtract일때_2_1는_1을_반환해야한다() {
    // given
    let input = Operator.subtract
    // when
    let output = input.calculate(lhs: 2.0, rhs: 1.0)
    // then
    XCTAssertEqual(output, 1.0)
  }
  
  func test_Operator가_divide일때_4_2는_2을_반환해야한다() {
    // given
    let input = Operator.divide
    // when
    let output = input.calculate(lhs: 4.0, rhs: 2.0)
    // then
    XCTAssertEqual(output, 2.0)
  }
  
  func test_Operator가_divide일때_4_0은_NaN을_반환해야한다() {
    // given
    let input = Operator.divide
    // when
    let output = input.calculate(lhs: 4.0, rhs: 0)
    // then
    XCTAssertTrue(output.isNaN)
  }
  
  func test_Operator가_subtract일때_2_3는_6을_반환해야한다() {
    // given
    let input = Operator.multiply
    // when
    let output = input.calculate(lhs: 2.0, rhs: 3.0)
    // then
    XCTAssertEqual(output, 6.0)
  }
}

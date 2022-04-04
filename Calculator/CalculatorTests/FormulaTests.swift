//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by Lingo on 2022/03/17.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
  
  private var sut: Formula!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    self.sut = Formula()
  }
  
  override func tearDownWithError() throws {
    try super.tearDownWithError()
    self.sut = nil
  }
  
  func test_result_operands_operators_queue_add가_주어졌을때_계산_결과_3을_반환해야한다() {
    // given when
    self.sut.operands.enqueue(1.0)
    self.sut.operands.enqueue(2.0)
    self.sut.operators.enqueue(.add)
    // then
    XCTAssertEqual(try self.sut.result(), 3.0)
  }
  
  func test_result_operands_operators_queue_subtract가_주어졌을때_계산_결과_0을_반환하면_안된다() {
    // given when
    self.sut.operands.enqueue(5.0)
    self.sut.operands.enqueue(10.0)
    self.sut.operators.enqueue(.subtract)
    // then
    XCTAssertNotEqual(try self.sut.result(), .zero)
  }
  
  func test_result_operands_operators_queue_multiply가_주어졌을때_계산_결과_10을_반환해야한다() {
    // given when
    self.sut.operands.enqueue(2.0)
    self.sut.operands.enqueue(5.0)
    self.sut.operators.enqueue(.multiply)
    // then
    XCTAssertEqual(try self.sut.result(), 10.0)
  }
  
  func test_result_operands_operators_queue_divide_add가_주어졌을때_계산_결과_NaN을_반환해야한다() {
    // given when
    self.sut.operands.enqueue(2.0)
    self.sut.operands.enqueue(.zero)
    self.sut.operands.enqueue(5.0)
    self.sut.operators.enqueue(.divide)
    self.sut.operators.enqueue(.add)
    // then
    XCTAssertTrue(try self.sut.result().isNaN)
  }
  
  func test_result_add_했을때_3이_반환되어야한다() {
    // given
    self.sut.operands.enqueue(1.0)
    self.sut.operands.enqueue(2.0)
    // when
    self.sut.operators.enqueue(.add)
    // then
    XCTAssertEqual(try self.sut.result(), 3.0)
  }
  
  func test_result_subtract_했을때_1이_반환되어야한다() {
    // given
    self.sut.operands.enqueue(2.0)
    self.sut.operands.enqueue(1.0)
    // when
    self.sut.operators.enqueue(.subtract)
    // then
    XCTAssertEqual(try self.sut.result(), 1.0)
  }
  
  func test_result_divide_했을때_2가_반환되어야한다() {
    // given
    self.sut.operands.enqueue(4.0)
    self.sut.operands.enqueue(2.0)
    // when
    self.sut.operators.enqueue(.divide)
    // then
    XCTAssertEqual(try self.sut.result(), 2.0)
  }
  
  func test_result_multiply_했을때_6이_반환되어야한다() {
    // given
    self.sut.operands.enqueue(2.0)
    self.sut.operands.enqueue(3.0)
    // when
    self.sut.operators.enqueue(.multiply)
    // then
    XCTAssertEqual(try self.sut.result(), 6.0)
  }
}

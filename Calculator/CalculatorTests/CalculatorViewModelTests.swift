//
//  CalculatorViewModelTests.swift
//  CalculatorTests
//
//  Created by Lingo on 2022/03/24.
//

import XCTest
@testable import Calculator

final class CalculatorViewModelTests: XCTestCase {
  
  private var sut: CalculatorViewModel?
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    self.sut = CalculatorViewModel()
  }
  
  override func tearDownWithError() throws {
    try super.tearDownWithError()
    self.sut = nil
  }
  
  func testClearAll_WhenCalled_OperatorTypeShouldReturnNil() {
    // given
    self.sut?.operandValue.next("1")
    self.sut?.operatorType.next("+")
    self.sut?.operatorType.next("1")
    // when
    self.sut?.clearAll()
    // then
    XCTAssertNil(self.sut?.operatorType.value)
  }
  
  func testClearAll_WhenCalled_OperandValueShouldReturnZero() {
    // given
    self.sut?.operandValue.next("1")
    self.sut?.operatorType.next("+")
    self.sut?.operatorType.next("1")
    // when
    self.sut?.clearAll()
    let output = self.sut?.operandValue.value
    // then
    XCTAssertEqual(output, "0")
  }
  
  func testClearEntry_WhenCalled_OperatorTypeShouldNotReturnNil() {
    // given
    self.sut?.operandValue.next("1")
    self.sut?.operatorType.next("+")
    self.sut?.operatorType.next("1")
    // when
    self.sut?.clearEntry()
    // then
    XCTAssertNotNil(self.sut?.operatorType.value)
  }
  
  func testClearEntry_WhenCalled_OperandValueShouldReturnZero() {
    // given
    self.sut?.operandValue.next("1")
    self.sut?.operatorType.next("+")
    self.sut?.operatorType.next("1")
    // when
    self.sut?.clearEntry()
    let output = self.sut?.operandValue.value
    // then
    XCTAssertEqual(output, "0")
  }
  
  func testConvertSign_WhenCalled_OperandValueShouldReturnWithMinus() {
    // given
    self.sut?.operandValue.next("1234.0")
    // when
    self.sut?.convertSign()
    let output = self.sut?.operandValue.value
    // then
    XCTAssertEqual(output, "-1234.0")
  }
  
  func testConvertSign_WhenCalled_OperandValueShouldReturnZero() {
    // given
    self.sut?.operandValue.next("0")
    // when
    self.sut?.convertSign()
    let output = self.sut?.operandValue.value
    // then
    XCTAssertEqual(output, "0")
  }
  
  func testConvertSign_WhenDoubleZeroProvided_OperandValueShouldReturnDoubleZero() {
    // given
    self.sut?.operandValue.next("00")
    // when
    self.sut?.convertSign()
    let output = self.sut?.operandValue.value
    // then
    XCTAssertEqual(output, "00")
  }
  
  func testDidTapDotButton_WhenCalled_OperandValueShouldReturnWithDot() {
    // given
    self.sut?.operandValue.next("1")
    // when
    self.sut?.didTapDotButton()
    let output = self.sut?.operandValue.value
    // then
    XCTAssertEqual(output, "1.")
  }
}

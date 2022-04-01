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
  
  // MARK: - clearAll
  
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
  
  // MARK: - clearEntry
  
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
  
  // MARK: - convertSign
  
  func testConvertSign_WhenCalled_OperandValueShouldReturnWithMinus() {
    // given
    self.sut?.operandValue.next("1234.0")
    // when
    self.sut?.convertSign()
    let output = self.sut?.operandValue.value
    // then
    XCTAssertEqual(output, "-1234.0")
  }
  
  func testConvertSign_WhenCalled_OperandValueShouldNotReturnMinus() {
    // given
    self.sut?.operandValue.next("-1234.0")
    // when
    self.sut?.convertSign()
    let output = self.sut?.operandValue.value
    // then
    XCTAssertEqual(output, "1234.0")
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
  
  // MARK: - addDot
  
  func testAddDot_WhenDotNotUsed_ShouldReturnWithDot() {
    // given
    self.sut?.operandValue.next("1")
    // when
    self.sut?.addDot()
    let output = self.sut?.operandValue.value
    // then
    XCTAssertEqual(output, "1.")
  }
  
  func testAddDot_WhenDotIsUsed_ShouldEarlyExit() {
    // given
    self.sut?.operandValue.next("1.")
    // when
    self.sut?.addDot()
    let output = self.sut?.operandValue.value
    // then
    XCTAssertEqual(output, "1.")
  }
  
  
  // MARK: - addOperand
  
  func testAddOperand_WhenOutOfBoundsOperandProvided_ShouldEarlyExit() {
    // given
    self.sut?.addOperand(of: "1111111111111111")
    // when
    self.sut?.addOperand(of: "2")
    let output = self.sut?.operandValue.value
    // then
    XCTAssertNotEqual(output, "11111111111111112")
  }
  
  // MARK: - addOperator
  
  func testAddOperator_WhenOperandIsNaN_ShouldReturnFalse() {
    // given
    self.sut?.operandValue.next("nan")
    // when
    let output = self.sut?.addOperator(of: "+")
    // then
    XCTAssertEqual(output, false)
  }
  
  func testAddOperator_WhenOperandIsZero_ShouldReturnFalse() {
    // given
    self.sut?.operandValue.next("0")
    // when
    let output = self.sut?.addOperator(of: "+")
    // then
    XCTAssertEqual(output, false)
  }
  
  func testAddOperator_WhenOperandIsZeroAndOperatorNotNil_ShouldReturnFalse() {
    // given
    self.sut?.operandValue.next("0")
    self.sut?.operatorType.next("+")
    // when
    let output = self.sut?.addOperator(of: "+")
    // then
    XCTAssertEqual(output, false)
  }
  
  func testAddOperator_WhenOneIsProvided_ShouldReturnTrue() {
    // given
    self.sut?.operandValue.next("1")
    // when
    let output = self.sut?.addOperator(of: "+")
    // then
    XCTAssertEqual(output, true)
  }
  
  func testAddOperator_WhenOnePlusTwoIsProvided_ShouldReturnTrue() {
    // given
    self.sut?.operandValue.next("1")
    self.sut?.operatorType.next("+")
    self.sut?.operandValue.next("2")
    // when
    let output = self.sut?.addOperator(of: "×")
    // then
    XCTAssertEqual(output, true)
  }
  
  // MARK: - calculate
  
  func testCalculate_WhenOperandIsZeroAndOperatorIsNil_ShouldReturnFalse() {
    // given
    self.sut?.addOperand(of: "0")
    // when
    let output = self.sut?.calculate()
    // then
    XCTAssertEqual(output, false)
  }
  
  func testCalculate_WhenNormalFormulaIsProvided_ShouldReturnTrue() {
    // given
    self.sut?.addOperand(of: "1")
    _ = self.sut?.addOperator(of: "+")
    self.sut?.addOperand(of: "2")
    // when
    let output = self.sut?.calculate()
    // then
    XCTAssertEqual(output, true)
  }
  
  func testCalculate_WhenResultIsZero_ShouldReturnTrue() {
    // given
    self.sut?.addOperand(of: "1")
    _ = self.sut?.addOperator(of: "−")
    self.sut?.addOperand(of: "1")
    // when
    let output = self.sut?.calculate()
    // then
    XCTAssertEqual(output, true)
  }
}

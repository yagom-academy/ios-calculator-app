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
  
  func test_result_operands_operators_queue가_주어졌을때_계산_결과_3을_반환해야한다() {
    // given
    self.sut.operands.enqueue(1.0)
    self.sut.operands.enqueue(2.0)
    self.sut.operators.enqueue(Operator.add)
    // when
    let output = self.sut.result()
    // then
    XCTAssertEqual(output, 3.0)
  }
}

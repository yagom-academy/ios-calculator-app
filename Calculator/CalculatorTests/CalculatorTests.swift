//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by song on 2022/03/21.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
  var sut: Formula!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = Formula()
    
  }
  
  override func tearDownWithError() throws {
    try super.tearDownWithError()
    sut = nil
  }
  
  
  func test_result_함수를_호출하면_1plus1이_2가되는지() {
    XCTAssertEqual(ExpressionParser.parse(from: "1 + 1").result(), 2)
  }
}
  

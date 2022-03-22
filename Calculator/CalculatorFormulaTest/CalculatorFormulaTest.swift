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
  
  func test_result_함수를_호출하면_기호로끝나도_예외처리가_되는지() {
    let inputString = "1 + 1  +  "
    
    let result = ExpressionParser.parse(from: inputString).result()
    
    switch result {
    case .success(let number):
      XCTAssertEqual(number, 2)
    case .failure(let error):
      XCTAssertEqual(error, CalculatorError.nonNumber)
    }
  }
  
  func test_result_함수를_호출하면_0으로_나누었을때_예외처리가_되는지() {
    let inputString = "1 / 0"
    
    let result = ExpressionParser.parse(from: inputString).result()
    
    switch result {
    case .success(let number):
      XCTAssertEqual(number, Double.infinity)
    case .failure(let error):
      XCTAssertEqual(error, CalculatorError.divisionByZero)
    }
  }
  
  func test_result_함수를_호출하고_빈칸을_입력했을때_에러처리가_되는지() {
    let inputString = ""
    
    let result = ExpressionParser.parse(from: inputString).result()
    
    switch result {
    case .success(let number):
      XCTAssertEqual(number, 0)
    case .failure(let error):
      XCTAssertEqual(error, CalculatorError.nonNumber)
    }
  }
  
  func test_result_숫자대신_기호를_입력했을때_예외처리가_되는지() {
    let inputString = "1 + 1  1"
    
    let result = ExpressionParser.parse(from: inputString).result()
    
    switch result {
    case .success(let number):
      XCTAssertEqual(number, 2)
    case .failure(let error):
      XCTAssertEqual(error, CalculatorError.nonOperator)
    }
  }
}


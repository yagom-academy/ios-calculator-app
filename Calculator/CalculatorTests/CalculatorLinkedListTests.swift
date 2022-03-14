//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Lingo on 2022/03/14.
//

import XCTest
@testable import Calculator

class CalculatorLinkedListTests: XCTestCase {
  
  var sut: CalculatorLinkedList<Double>!
  
  override func setUpWithError() throws {
    self.sut = CalculatorLinkedList()
  }
  
  override func tearDownWithError() throws {
    self.sut = nil
  }
  
  // MARK: - append()
  
  func test_append_data를_담아_호출할때_count가_1_증가해야한다() {
    // given
    let data = 1.0
    let input = self.sut.count
    
    // when
    self.sut.append(data)
    let output = self.sut.count
    
    // then
    XCTAssertEqual(output, input + 1)
  }
}

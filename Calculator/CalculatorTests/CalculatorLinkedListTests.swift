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
  
  func test_append_count가_0에서_호출시_front와_rear가_nil이되면_안된다() {
    // given
    let data = 1.0
    
    // when
    let output = self.sut.count
    self.sut.append(data)
    
    // then
    XCTAssertEqual(output, 0)
    XCTAssertNotNil(self.sut.front)
    XCTAssertNotNil(self.sut.rear)
  }
  
  func test_append_count가_0에서_호출시_front와_rear가_nil이_아닌_같은_인스턴스를_참조해야한다() {
    // given
    let data = 1.0
    
    // when
    self.sut.append(data)
    
    // then
    XCTAssertNotNil(self.sut.front)
    XCTAssertNotNil(self.sut.rear)
    XCTAssertTrue(self.sut.front === self.sut.rear)
  }
}

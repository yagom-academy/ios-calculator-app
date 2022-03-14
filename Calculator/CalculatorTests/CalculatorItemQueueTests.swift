//
//  CalculatorItemQueueTests.swift
//  CalculatorTests
//
//  Created by Lingo on 2022/03/14.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
  
  var sut: CalculatorItemQueue<Int>!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    self.sut = CalculatorItemQueue<Int>()
  }

  override func tearDownWithError() throws {
    try super.tearDownWithError()
    self.sut = nil
  }
  
  func test_enqueue_elements의_개수가_1_증가해야한다() {
    // given
    let input = sut.elements.count
    
    // when
    self.sut.enqueue(data: 1)
    let output = sut.elements.count
    
    // then
    XCTAssertEqual(output, input + 1)
  }
  
  func test_enqueue_1을_넣으면_elements는_배열_1을_반환해야한다() {
    // given
    self.sut.enqueue(data: 1)
    
    // when
    let output = self.sut.elements
    
    // then
    XCTAssertEqual(output, [1])
  }
  
  func test_enqueue_여러번하면_elements는_넣은_원소들의_배열을_반환해야한다() {
    // given
    self.sut.enqueue(data: 1)
    self.sut.enqueue(data: 2)
    self.sut.enqueue(data: 3)
    self.sut.enqueue(data: 4)
    
    // when
    let output = self.sut.elements
    
    // then
    XCTAssertEqual(output, [1, 2, 3, 4])
  }
  
}

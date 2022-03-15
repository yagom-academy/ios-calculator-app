//
//  CalculatorItemQueueTests.swift
//  CalculatorTests
//
//  Created by Lingo on 2022/03/14.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
  
  var sut: CalculatorItemQueue<Double>!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    self.sut = CalculatorItemQueue()
  }

  override func tearDownWithError() throws {
    try super.tearDownWithError()
    self.sut = nil
  }
  
  // MARK: - enqueue()
  
  func test_enqueue_elements의_개수가_1_증가해야한다() {
    // given
    let input = self.sut.count
    
    // when
    self.sut.enqueue(1.0)
    let output = self.sut.count
    
    // then
    XCTAssertEqual(output, input + 1)
  }
  
  func test_enqueue_1을_넣으면_elements는_배열_1을_반환해야한다() {
    // given
    self.sut.enqueue(1.0)
    
    // when
    let output = self.sut.elements
    
    // then
    XCTAssertEqual(output, [1.0])
  }
  
  func test_enqueue_여러번하면_elements는_넣은_원소들의_배열을_반환해야한다() {
    // given
    self.sut.enqueue(1.0)
    self.sut.enqueue(2.0)
    self.sut.enqueue(3.0)
    self.sut.enqueue(4.0)
    
    // when
    let output = self.sut.elements
    
    // then
    XCTAssertEqual(output, [1.0, 2.0, 3.0, 4.0])
  }
  
  // MARK: - dequeue()
  
  func test_dequeue_elements가_비어있을때_호출하면_nil이_반환되어야한다() {
    // given
    let input = self.sut.count
    
    // when
    let output = self.sut.dequeue()
    
    // then
    XCTAssertEqual(input, 0)
    XCTAssertNil(output)
  }
  
  func test_dequeue_elements_1_2_3이_들어있고_한번_호출시_맨_앞의_1이_반환되어야한다() {
    // given
    self.sut.enqueue(1.0)
    self.sut.enqueue(2.0)
    self.sut.enqueue(3.0)
    
    // when
    let output = self.sut.dequeue()
    
    // then
    XCTAssertEqual(output, 1.0)
  }
  
  func test_dequeue_elements_1_2_3이_들어있고_한번_호출시_나머지가_2_3이_반환되어야한다() {
    // given
    self.sut.enqueue(1.0)
    self.sut.enqueue(2.0)
    self.sut.enqueue(3.0)
    
    // when
    _ = self.sut.dequeue()
    let output = self.sut.elements
    
    // then
    XCTAssertEqual(output, [2.0, 3.0])
  }
  
  // MARK: - first
  
  func test_first_호출시_원소가_존재하지_않으면_nil을_반환해야한다() {
    // given
    self.sut.clear()
    let input = self.sut.count
    
    // when
    let output = self.sut.first
    
    // then
    XCTAssertEqual(input, 0)
    XCTAssertNil(output)
  }
  
  func test_first_호출시_원소가_존재하면_맨앞의_원소를_반환해야한다() {
    // given
    self.sut.enqueue(1.0)
    self.sut.enqueue(2.0)
    self.sut.enqueue(3.0)
    
    // when
    let output = self.sut.first
    
    // then
    XCTAssertEqual(output, 1.0)
  }
  
  // MARK: - clear()
  
  func test_clear_호출시_elements가_빈_배열이_되어야한다() {
    // given
    self.sut.enqueue(1.0)
    self.sut.enqueue(2.0)
    self.sut.enqueue(3.0)
    
    // when
    self.sut.clear()
    let output = self.sut.elements
    
    // then
    XCTAssertEqual(output, [])
  }
}

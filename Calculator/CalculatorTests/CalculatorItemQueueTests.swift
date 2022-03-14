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
  
  // MARK: - enqueue()
  
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
  
  // MARK: - dequeue()
  
  func test_dequeue_elements가_비어있을때_호출하면_nil이_반환되어야한다() {
    // given
    let input = self.sut.elements.count
    
    // when
    let output = self.sut.dequeue()
    
    // then
    XCTAssertEqual(input, 0)
    XCTAssertNil(output)
  }
  
  func test_dequeue_elements_1_2_3이_들어있고_한번_호출시_맨_앞의_1이_반환되어야한다() {
    // given
    let input = [1, 2, 3]
    self.sut.elements = input
    
    // when
    let output = self.sut.dequeue()
    
    // then
    XCTAssertEqual(output, 1)
  }
  
  func test_dequeue_elements_1_2_3이_들어있고_한번_호출시_나머지가_2_3이_반환되어야한다() {
    // given
    let input = [1, 2, 3]
    self.sut.elements = input
    
    // when
    _ = self.sut.dequeue()
    let output = self.sut.elements
    
    // then
    XCTAssertEqual(output, [2, 3])
  }
  
  // MARK: - peek()
  
  func test_peek_호출시_원소가_존재하지_않으면_nil을_반환해야한다() {
    // given
    let input: [Int] = []
    self.sut.elements = input
    
    // when
    let output = self.sut.peek()
    
    // then
    XCTAssertNil(output)
  }
  
  func test_peek_호출시_원소가_존재하면_맨앞의_원소를_반환해야한다() {
    // given
    let input = [1, 2, 3]
    self.sut.elements = input
    
    // when
    let output = self.sut.peek()
    
    // then
    XCTAssertEqual(output, 1)
  }
  
  // MARK: - clear()
  
  func test_clear_호출시_elements가_빈_배열이_되어야한다() {
    // given
    let input = [1, 2, 3]
    self.sut.elements = input
    
    // when
    self.sut.clear()
    let output = self.sut.elements
    
    // then
    XCTAssertEqual(output, [])
  }
}

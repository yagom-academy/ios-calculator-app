//
//  CalculatorItemQueueTests.swift
//  CalculatorTests
//
//  Created by Lingo on 2022/03/14.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
  
  private var sut: CalculatorItemQueue<Double>!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    self.sut = CalculatorItemQueue()
  }
  
  override func tearDownWithError() throws {
    try super.tearDownWithError()
    self.sut = nil
  }
  
  // MARK: - enqueue()
  
  func test_enqueue_호출시_개수가_1_증가해야한다() {
    // given
    let input = self.sut.count
    // when
    self.sut.enqueue(1.0)
    let output = self.sut.count
    // then
    XCTAssertEqual(output, input + 1)
  }
  
  func test_enqueue_빈배열에_1을_호출하면_추가되는가() {
    // given
    let input = 1.0
    // when
    self.sut.enqueue(input)
    let result = self.sut.first
    // then
    XCTAssertEqual(result, 1.0)
  }
  
  func test_enqueue_빈배열에_여러번_호출하면_마지막값이_정상반환되는가() {
    // given
    self.sut.enqueue(1.0)
    self.sut.enqueue(2.0)
    self.sut.enqueue(3.0)
    self.sut.enqueue(4.0)
    // when
    let result = sut.last
    // then
    XCTAssertEqual(result, 4.0)
  }
  
  // MARK: - dequeue()
  
  func test_dequeue_큐가_비어있을때_호출시_nil을_반환해야한다() {
    // given when
    let output = self.sut.dequeue()
    // then
    XCTAssertEqual(output, nil)
  }
  
  func test_dequeue_큐에_1_2가_들어있고_호출시_1을_반환해야한다() {
    // given
    self.sut.enqueue(1.0)
    self.sut.enqueue(2.0)
    // when
    let output = self.sut.dequeue()
    // then
    XCTAssertEqual(output, 1.0)
  }
  
  func test_dequeue_큐에_1_2가_들어있고_호출시_2를_반환해야한다() {
    // given
    self.sut.enqueue(1.0)
    self.sut.enqueue(2.0)
    // when
    _ = self.sut.dequeue()
    let output = self.sut.first
    // then
    XCTAssertEqual(output, 2.0)
  }
  
  func test_dequeue_빈배열에서_값을_호출하면_nil을_반환하는가() {
    // given when
    let result = self.sut.dequeue()
    // then
    XCTAssertNil(result)
  }
  
  func test_dequeue_값이_있는_배열에_호출하면_정상반환하는가() {
    // given
    self.sut.enqueue(1.0)
    self.sut.enqueue(2.0)
    // when
    let result = self.sut.dequeue()
    // then
    XCTAssertEqual(result, 1.0)
  }
  
  func test_dequeue_값이_하나인_배열에_호출하면_정상반환하는가() {
    // given
    self.sut.enqueue(2.0)
    // when
    let result = self.sut.dequeue()
    // then
    XCTAssertEqual(result, 2.0)
  }
  
  func test_dequeue_enqueue를_2번_dequeue를_2번하면_정상반환하는가() {
    // given
    self.sut.enqueue(1.0)
    self.sut.enqueue(2.0)
    // when
    _ = self.sut.dequeue()
    let result = self.sut.dequeue()
    // then
    XCTAssertEqual(result, 2.0)
  }
  
  func test_dequeue_enqueue를_1번_dequeue를_2번하면_nil을_반환하는가() {
    // given
    self.sut.enqueue(1.0)
    // when
    _ = self.sut.dequeue()
    let result = self.sut.dequeue()
    // then
    XCTAssertNil(result)
  }
  
  // MARK: - count
  
  func test_count_배열의_개수를_정상적으로_반환하는가() {
    // given
    self.sut.enqueue(1.0)
    self.sut.enqueue(2.0)
    self.sut.enqueue(3.0)
    self.sut.enqueue(4.0)
    // when
    let result = self.sut.count
    // then
    XCTAssertEqual(result, 4)
  }
  
  // MARK: - first
  
  func test_first_호출시_큐가_비어있다면_nil을_반환해야한다() {
    // given when
    let output = self.sut.first
    // then
    XCTAssertEqual(output, nil)
  }
  
  func test_first_1_2가_들어있는_큐에서_호출시_1을_반환해야한다() {
    // given
    self.sut.enqueue(1.0)
    self.sut.enqueue(2.0)
    // when
    let output = self.sut.first
    // then
    XCTAssertEqual(output, 1.0)
  }
  
  // MARK: - removeAll()
  
  func test_removeAll_호출시_비어_있어야한다() {
    // given
    self.sut.enqueue(1.0)
    self.sut.enqueue(2.0)
    self.sut.enqueue(3.0)
    self.sut.enqueue(4.0)
    // when
    self.sut.removeAll()
    let output = self.sut.isEmpty
    // then
    XCTAssertTrue(output)
  }
  
  // MARK: - isEmpty
  
  func test_isEmpty_큐가_비어있을때_호출시_true를_반환해야한다() {
    // given when
    let output = self.sut.isEmpty
    // then
    XCTAssertEqual(output, true)
  }
}

//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Lingo on 2022/03/14.
//

import XCTest
@testable import Calculator

final class CalculatorLinkedListTests: XCTestCase {
  
  private var sut: CalculatorLinkedList<Double>!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    self.sut = CalculatorLinkedList()
  }
  
  override func tearDownWithError() throws {
    try super.tearDownWithError()
    self.sut = nil
  }
  
  // MARK: - append()
  
  func test_append_호출시_개수가_1_증가해야한다() {
    // given
    let input = self.sut.count
    
    // when
    self.sut.append(1.0)
    let output = self.sut.count
    
    // then
    XCTAssertEqual(output, input + 1)
  }
  
  func test_append_리스트가_비어있을때_호출시_front와_rear가_nil이_아닌값을_반환해야한다() {
    // given when
    let output = self.sut.count
    self.sut.append(1.0)
    
    // then
    XCTAssertEqual(output, 0)
    XCTAssertNotNil(self.sut.front)
    XCTAssertNotNil(self.sut.rear)
  }
  
  func test_append_리스트가_비어있을때_호출시_front와_rear가_같은_인스턴스를_참조해야한다() {
    // given when
    let output = self.sut.count
    self.sut.append(1.0)
    
    // then
    XCTAssertEqual(output, 0)
    XCTAssertTrue(self.sut.front === self.sut.rear)
  }
  
  func test_append_리스트의_개수가_1일때_호출시_front의_next와_rear가_같은_인스턴스를_참조해야한다() {
    // given
    self.sut.append(1.0)
    let input = self.sut.count
    
    // when
    self.sut.append(2.0)
    
    // then
    XCTAssertEqual(input, 1)
    XCTAssertNotNil(self.sut.front?.next)
    XCTAssertNotNil(self.sut.rear)
    XCTAssertTrue(self.sut.front?.next === self.sut.rear)
  }
  
  func test_append_리스트의_개수가_2일때_호출시_front의_next_next와_rear가_같은_인스턴스를_참조해야한다() {
    // given
    self.sut.append(1.0)
    self.sut.append(1.0)
    let input = self.sut.count
    
    // when
    self.sut.append(1.0)
    
    // then
    XCTAssertEqual(input, 2)
    XCTAssertNotNil(self.sut.front?.next?.next)
    XCTAssertNotNil(self.sut.rear)
    XCTAssertTrue(self.sut.front?.next?.next === self.sut.rear)
  }
  
  // MARK: - first
  
  func test_first_1을_넣어_리스트가_비어있지_않을때_호출시_front의_data_1을_반환해야한다() {
    // given
    self.sut.append(1.0)
    let input = self.sut.isEmpty
    
    // when
    let output = self.sut.first
    
    // then
    XCTAssertFalse(input)
    XCTAssertEqual(output, 1.0)
  }
  
  func test_first_리스트가_비어있을때_호출시_nil을_반환해야한다() {
    // given
    let input = self.sut.isEmpty
    
    // when
    let output = self.sut.first
    
    // then
    XCTAssertTrue(input)
    XCTAssertNil(output)
  }
  
  // MARK: - removeFirst()
  
  func test_removeFirst_리스트가_비어있다면_호출시_nil을_반환해야한다() {
    // given
    let input = self.sut.isEmpty
    
    // when
    let output = self.sut.removeFirst()
    
    // then
    XCTAssertTrue(input)
    XCTAssertNil(output)
  }
  
  func test_removeFirst_1을_넣어_리스트가_비어있지_않을때_호출시_맨_앞_노드의_data_1을_반환해야한다() {
    // given
    self.sut.append(1.0)
    let input = self.sut.isEmpty
    
    // when
    let output = self.sut.removeFirst()
    
    // then
    XCTAssertFalse(input)
    XCTAssertEqual(output, 1.0)
  }
  
  func test_removeFirst_리스트의_개수가_1일때_호출시_count는_0을_isEmpty는_true를_반환해야한다() {
    // given
    self.sut.append(1.0)
    let inputCount = self.sut.count
    
    // when
    _ = self.sut.removeFirst()
    let outputCount = self.sut.count
    let output = self.sut.isEmpty
    
    // then
    XCTAssertEqual(inputCount, 1)
    XCTAssertEqual(outputCount, 0)
    XCTAssertTrue(output)
  }
  
  func test_removeFirst_리스트의_개수가_2일때_호출시_count는_1을_반환해야한다() {
    self.sut.append(1.0)
    self.sut.append(2.0)
    let inputCount = self.sut.count
    
    // when
    _ = self.sut.removeFirst()
    let outputCount = self.sut.count
    
    // then
    XCTAssertEqual(inputCount, 2)
    XCTAssertEqual(outputCount, 1)
  }
  
  func test_removeAll_리스트가_비어있지_않을때_호출시_count가_0을_반환해야한다() {
    // given
    self.sut.append(1.0)
    self.sut.append(2.0)
    let input = self.sut.isEmpty
    
    // when
    self.sut.removeAll()
    let output = self.sut.count
    
    // then
    XCTAssertFalse(input)
    XCTAssertEqual(output, 0)
  }
  
  func test_removeAll_리스트가_비어있지_않을때_호출시_isEmpty가_true을_반환해야한다() {
    // given
    self.sut.append(1.0)
    self.sut.append(2.0)
    let input = self.sut.isEmpty
    
    // when
    self.sut.removeAll()
    let output = self.sut.isEmpty
    
    // then
    XCTAssertFalse(input)
    XCTAssertTrue(output)
  }
  
  func test_removeAll_리스트가_비어있지_않을때_호출시_front가_nil을_반환해야한다() {
    // given
    self.sut.append(1.0)
    self.sut.append(2.0)
    let input = self.sut.isEmpty
    
    // when
    self.sut.removeAll()
    let output = self.sut.front
    
    // then
    XCTAssertFalse(input)
    XCTAssertNil(output)
  }
  
  func test_removeAll_리스트가_비어있지_않을때_호출시_rear가_nil을_반환해야한다() {
    // given
    self.sut.append(1.0)
    self.sut.append(2.0)
    let input = self.sut.isEmpty
    
    // when
    self.sut.removeAll()
    let output = self.sut.rear
    
    // then
    XCTAssertFalse(input)
    XCTAssertNil(output)
  }
  
  func test_removeAll_리스트가_비어있을때_호출시_front와_rear이_nil을_반환해야한다() {
    // given
    let input = self.sut.isEmpty
    
    // when
    self.sut.removeAll()
    
    // then
    XCTAssertTrue(input)
    XCTAssertNil(self.sut.front)
    XCTAssertNil(self.sut.rear)
  }
}

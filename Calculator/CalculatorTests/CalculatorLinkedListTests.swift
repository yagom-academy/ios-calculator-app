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
  
  func test_append_count가_1일때_새로운_노드를_추가하면_rear가_front의_next와_같은_인스턴스를_참조해야한다() {
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
  
  func test_append_count가_2일때_새로운_노드를_추가하면_rear가_front의_next와_같은_인스턴스를_참조해야한다() {
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
  
  func test_first_프로퍼티를_호출할때_리스트가_비어있지_않을시_front의_data를_반환한다() {
    // given
    self.sut.append(1.0)
    let input = self.sut.isEmpty
    
    // when
    let data = self.sut.first
    
    // then
    XCTAssertFalse(input)
    XCTAssertEqual(data, 1.0)
  }
  
  func test_first_프로퍼티를_호출할때_리스트가_비어있을시_nil을_반환한다() {
    // given
    let input = self.sut.isEmpty
    
    // when
    let data = self.sut.first
    
    // then
    XCTAssertTrue(input)
    XCTAssertNil(data)
  }
  
  // MARK: - removeFirst()
  
  func test_removeFirst_호출시_리스트가_비어있다면_nil을_반환한다() {
    // given
    let input = self.sut.isEmpty
    
    // when
    let output = self.sut.removeFirst()
    
    // then
    XCTAssertTrue(input)
    XCTAssertNil(output)
  }
  
  func test_removeFirst_호출시_리스트가_비어있지_않다면_노드의_data를_반환한다() {
    // given
    self.sut.append(1.0)
    let input = self.sut.isEmpty
    
    // when
    let output = self.sut.removeFirst()
    
    // then
    XCTAssertFalse(input)
    XCTAssertEqual(output, 1.0)
  }
  
  func test_removeFirst_호출시_기존_리스트의_개수가_1일_경우_count는_0을_반환하고_isEmpty는_true이다() {
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
  
  func test_removeFirst_호출시_기존_리스트의_개수가_2일_경우_count는_1을_반환한다() {
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
  
  func test_removeAll_호출시_count가_0을_반환해야한다() {
    // given
    self.sut.append(1.0)
    self.sut.append(2.0)
    
    // when
    self.sut.removeAll()
    let output = self.sut.count
    
    // then
    XCTAssertEqual(output, 0)
  }
  
  func test_removeAll_호출시_isEmpty가_true을_반환해야한다() {
    // given
    self.sut.append(1.0)
    self.sut.append(2.0)
    
    // when
    self.sut.removeAll()
    let output = self.sut.isEmpty
    
    // then
    XCTAssertTrue(output)
  }
  
  func test_removeAll_호출시_front가_nil을_반환해야한다() {
    // given
    self.sut.append(1.0)
    self.sut.append(2.0)
    
    // when
    self.sut.removeAll()
    let output = self.sut.front
    
    // then
    XCTAssertNil(output)
  }
  
  func test_removeAll_호출시_rear가_nil을_반환해야한다() {
    // given
    self.sut.append(1.0)
    self.sut.append(2.0)
    
    // when
    self.sut.removeAll()
    let output = self.sut.rear
    
    // then
    XCTAssertNil(output)
  }
}

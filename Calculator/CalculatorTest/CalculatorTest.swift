//
//  CalculatorTest.swift
//  CalculatorTest
//
//  Created by song on 2022/03/15.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
  var sut: CalculateItemQueue<Double>!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = CalculateItemQueue()
  }
  
  override func tearDownWithError() throws {
    try super.tearDownWithError()
    sut = nil
  }
  
  func test_enqueue함수를_호출하면_1이_올라가는지() {
    let input = 1.0
    
    sut.enqueue(data: input)
    
    XCTAssertEqual(sut.list.head?.data, 1.0)
  }
  
  func test_enqueue함수를_호출하면_2가올라가는지() {
    let input = 2.0
    
    sut.enqueue(data: input)
    
    XCTAssertEqual(sut.list.head?.data, 2.0)
  }
  
  func test_dequeue함수를_호출하면_올라갔던_2가_내려가는지() {
    let input = 2.0
    
    sut.enqueue(data: input)
    sut.dequeue()
    
    XCTAssertEqual(sut.list.head?.data, nil)
  }
  
  func test_dequeue함수를_호출하면_올라갔던_1과2중_1이_내려가는지() {
    let inputOne = 1.0
    let inputTwo = 2.0
    
    sut.enqueue(data: inputOne)
    sut.enqueue(data: inputTwo)
    sut.dequeue()
    
    XCTAssertEqual(sut.list.head?.data, 2.0)
  }
  
  func test_dequeueAll함수를_호출하면_올라갔던_1과2가_모두내려가는지() {
    let inputOne = 1.0
    let inputTwo = 2.0
    
    sut.enqueue(data: inputOne)
    sut.enqueue(data: inputTwo)
    sut.dequeueAll()
    
    XCTAssertEqual(sut.list.head?.data, nil)
  }
  
  func test_presentAll함수를_호출하면_올라갔던_1과2가_모두보이는지() {
    let inputOne = 1.0
    let inputTwo = 2.0
    
    sut.enqueue(data: inputOne)
    sut.enqueue(data: inputTwo)
    sut.presentAll()
    
    XCTAssertEqual(sut.presentAll(), [1.0, 2.0])
  }
}

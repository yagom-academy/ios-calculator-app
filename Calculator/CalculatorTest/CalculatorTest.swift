//
//  CalculatorTest.swift
//  CalculatorTest
//
//  Created by song on 2022/03/15.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
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
}

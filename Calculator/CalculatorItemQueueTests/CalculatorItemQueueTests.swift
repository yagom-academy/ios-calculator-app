//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Kay on 2022/05/17.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {

    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>(queue: [1.0,2.0,3.0], head: 0)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_emptyWhenQueueDoesNotHaveElement() {
        // given
        // (큐에 요소 "1","2","3"이 있을때)
        
        // when (isEmpty를 수행하면)
        let result = sut.isEmpty
        
        // then (false를 반환한다)
        XCTAssertFalse(result)
    }
    
    func test_countReturnsTotalNumberOfElement() {
        // given
        // (큐에 요소 "1","2","3"이 있을때)
        
        // when (count를 수행하면)
        let count = sut.count
        let expected = 3
        // then (카운트가 실제 요소의 총 갯수와 맞는지 확인한다)
        XCTAssertEqual(count, expected)
    }
    
    func test_frontReturnsFirstElement() {
        // given
        // (큐에 요소 "1","2","3"이 있을때)
        
        // when (front를 수행하면)
        let result = sut.front
        let expected = 1.0
        // then (첫번째 요소를 표시한다)
        XCTAssertEqual(result, expected)
    }
    
    func test_rearReturnsLastElement() {
        // given
        // (큐에 요소 "1","2","3"이 있을때)
        
        // when (rear를 수행하면)
        let result = sut.rear
        let expected = 3.0
        // then (마지막 요소를 표시한다)
        XCTAssertEqual(result, expected)
    }
    
    func test_clearRemovesAllElementsInQueue() {
        // given
        // (큐에 요소 "1","2","3"이 있을때)
        
        // when (rear를 수행하면)
        sut.clear()
        let expected = 0
        // then (큐의 모든 요소가 제거된다)
        XCTAssertEqual(sut.count, expected)
    }
    
    func test_popRemovesAndReturnsLastElement() {
        // given
        // (큐에 요소 "1","2","3"이 있을때)
        
        // when
        let lastElementBeforePop = sut.pop()
        let expected = 3.0
        
        //then
        XCTAssertEqual(lastElementBeforePop, expected)
        XCTAssertEqual(sut.count, 2)
    }
}

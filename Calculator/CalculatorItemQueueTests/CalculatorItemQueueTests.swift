//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Kay on 2022/05/17.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {

    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String>(queue: ["1","2","3"], head: 0)
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
        
        // then (카운트가 실제 요소의 총 갯수와 맞는지 확인한다)
        XCTAssertEqual(count, 3)
    }
    
    func test_frontReturnsFirstElement() {
        // given
        // (큐에 요소 "1","2","3"이 있을때)
        
        // when (front를 수행하면)
        let result = sut.front
        
        // then (첫번째 요소를 표시한다)
        XCTAssertEqual(result, "1")
    }
    
    func test_rearReturnsLastElement() {
        // given
        // (큐에 요소 "1","2","3"이 있을때)
        
        // when (rear를 수행하면)
        let result = sut.rear
        
        // then (마지막 요소를 표시한다)
        XCTAssertEqual(result, "3")
    }
    
    func test_clearRemovesAllElementsInQueue() {
        // given
        // (큐에 요소 "1","2","3"이 있을때)
        
        // when (rear를 수행하면)
        sut.clear()
        
        // then (큐의 모든 요소가 제거된다)
        XCTAssertEqual(sut.count, 0)
    }
    
    func test_popRemovesAndReturnsLastElement() {
        // given
        // (큐에 요소 "1","2","3"이 있을때)
        
        // when
        let lastElementBeforePop = sut.pop()
        let expected = "3"
        
        //then
        XCTAssertEqual(lastElementBeforePop, expected)
        XCTAssertEqual(sut.count, 2)
    }
}

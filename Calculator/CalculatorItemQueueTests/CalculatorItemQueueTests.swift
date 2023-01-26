//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 천승현 on 2023/01/25.
//

import XCTest

final class CalculatorItemQueueTests: XCTestCase {

    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_isEmpty호출시_큐가비어있는상태라면_true를반환한다() {
        // given
        let input = ["1", "2", "3"]
        let expectation = true
        
        // when
        input.forEach { sut.enqueue($0) }
        sut.removeAllElement()
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_isEmpty호출시_큐에1과2와3이들어있다면_false를반환한다() {
        // given
        let input = ["1", "2", "3"]
        let expectation = false
        
        // when
        input.forEach { sut.enqueue($0) }
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_count호출시_큐에1과2와3이존재한다면_3을반환한다() {
        // given
        let input = ["1", "2", "3"]
        let expectation = 3
        
        // when
        input.forEach { sut.enqueue($0) }
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_count호출시_큐에값이존재하지않는다면_0을반환한다() {
        // given
        let expectation = 0
        
        // when
        sut.removeAllElement()
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_removeAllElement호출시_enqueueStack과dequeueStack에요소가있을때_enqueueStack과dequeueStack이지워진다() {
        // given
        let input = ["1", "2"]
        let inputAfterEnqueue = ["3", "4"]
        let expectation = 0
        
        // when
        input.forEach { sut.enqueue($0) }
        sut.dequeue()
        inputAfterEnqueue.forEach { sut.enqueue($0) }
        
        sut.removeAllElement()
        let result = sut.dequeueStack.count + sut.enqueueStack.count
        
        // then
        XCTAssertEqual(result, expectation)
    }

    func test_enqueue호출시_3을넣으면_enqueueStack이3을포함한다() {
        // given
        let input = "3"
        let expectation = true
        
        // when
        sut.enqueue(input)
        let result = sut.enqueueStack.contains("3")
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeueCurrentItem호출시_dequeueStack이비어있다면_reversed된enqueueStack이들어간다() {
        // given
        let input = ["1", "+", "3"]
        let expectation = ["3", "+"]
        
        // when
        input.forEach { sut.enqueue($0) }
        
        sut.dequeue()
        let result = sut.dequeueStack
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeueCurrentItem호출시_dequeueStack이비어있다면_enqueueStack이비워진다() {
        // given
        let input = ["1", "2", "3"]
        let expectation = true
        
        // when
        input.forEach { sut.enqueue($0) }
        sut.dequeue()
        let result = sut.enqueueStack.isEmpty
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeueCurrentItem호출시_dequeueStack이비어있지않다면_dequeueStack의마지막값을반환한다() {
        // given
        let input = ["1", "2", "3", "4", "5"]
        let expectation = "2"
        
        // when
        input.forEach { sut.enqueue($0) }
        sut.dequeue()
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
    }
}

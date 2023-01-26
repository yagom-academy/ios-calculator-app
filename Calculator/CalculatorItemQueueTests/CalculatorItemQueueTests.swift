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
        
        // when
        input.forEach { sut.enqueue($0) }
        sut.removeAllElement()
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty호출시_큐에1과2와3이들어있다면_false를반환한다() {
        // given
        let input = ["1", "2", "3"]
        
        // when
        input.forEach { sut.enqueue($0) }
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_removeAllElement호출시_큐에값이존재할때_큐가전부지워진다() {
        // given
        let input = ["1", "2"]
        let expectation = 0
        
        // when
        input.forEach { sut.enqueue($0) }
        
        sut.removeAllElement()
        let result = sut.dequeueStack.count + sut.enqueueStack.count
        
        // then
        XCTAssertEqual(result, expectation)
    }

    func test_enqueue호출시_3을넣으면_enqueueStack이3을포함한다() {
        // given
        let input = "3"
        
        // when
        sut.enqueue(input)
        let result = sut.enqueueStack.contains("3")
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_dequeue호출시_큐가비어있다면_nil을반환한다() {
        // given
        let input = ["1", "+", "3"]
        
        // when
        input.forEach { sut.enqueue($0) }
        sut.removeAllElement()
        
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_dequeue호출시_큐에값이존재한다면_첫번째요소를반환한다() {
        // given
        let input = ["1", "2", "3", "4", "5"]
        let expectation = "1"
        
        // when
        input.forEach { sut.enqueue($0) }
        
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
    }
}

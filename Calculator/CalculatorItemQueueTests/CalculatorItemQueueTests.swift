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
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_isEmpty호출시_dequeueStack은요소가있고enqueueStack은요소가없다면_false를반환한다() {
        // given
        let input = ["1", "2", "3"]
        let expectation = false
        
        // when
        input.forEach { sut.enqueueCurrentItem($0) }
        sut.dequeueCurrentItem()
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_isEmpty호출시_dequeueStack과enqueueStack모두비어있다면_true를반환한다() {
        // given
        let input = ["1", "2", "3"]
        let inputAfterEnqueue = ["4", "5", "6"]
        let expectation = true
        
        // when
        input.forEach { sut.enqueueCurrentItem($0) }
        sut.dequeueCurrentItem()
        inputAfterEnqueue.forEach { sut.enqueueCurrentItem($0) }
        
        sut.resetAllElement()
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_count호출시_enqueueStack은비어있고dequeueStack은요소가있을때_dequeueStack의count를반환한다() {
        // given
        let input = ["1", "2", "3"]
        let expectation = 2
        
        // when
        input.forEach { sut.enqueueCurrentItem($0) }
        sut.dequeueCurrentItem()
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_count호출시_enqueueStack과dequeueStack에요소가존재할때_두개의개수를_합친값을반환한다() {
        // given
        let input = ["1", "2", "3"]
        let inputAfterEnqueue = ["1", "2", "3"]
        let expectation = 5
        
        // when
        input.forEach { sut.enqueueCurrentItem($0) }
        sut.dequeueCurrentItem()
        inputAfterEnqueue.forEach { sut.enqueueCurrentItem($0) }
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_peek호출시_dequeueStack이비어있다면_enqueueStack의첫번째값을반환한다() {
        // given
        let input = ["1", "2", "3"]
        let expectation = "1"
        
        // when
        input.forEach { sut.enqueueCurrentItem($0) }
        let result = sut.peek
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_peek호출시_dequeueStack이비어있지않다면_dequeueStack의마지막값을반환한다() {
        // given
        let input = ["1", "2", "3", "4", "5"]
        let expectation = "2"
        
        // when
        input.forEach { sut.enqueueCurrentItem($0) }
        sut.dequeueCurrentItem()
        let result = sut.peek
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_resetAllElement호출시_enqueueStack과dequeueStack에요소가있을때_enqueueStack과dequeueStack이지워진다() {
        // given
        let input = ["1", "2"]
        let inputAfterEnqueue = ["3", "4"]
        let expectation = 0
        
        // when
        input.forEach { sut.enqueueCurrentItem($0) }
        sut.dequeueCurrentItem()
        inputAfterEnqueue.forEach { sut.enqueueCurrentItem($0) }
        
        sut.resetAllElement()
        let result = sut.dequeueStack.count + sut.enqueueStack.count
        
        // then
        XCTAssertEqual(result, expectation)
    }

    func test_enqueueCurrentItem호출시_3을넣으면_enqueueStack이3을포함한다() {
        // given
        let input = "3"
        let expectation = true
        
        // when
        sut.enqueueCurrentItem(input)
        let result = sut.enqueueStack.contains("3")
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeueCurrentItem호출시_dequeueStack이비어있다면_reversed된enqueueStack이들어간다() {
        // given
        let input = ["1", "+", "3"]
        let expectation = ["3", "+"]
        
        // when
        input.forEach { sut.enqueueCurrentItem($0) }
        
        sut.dequeueCurrentItem()
        let result = sut.dequeueStack
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeueCurrentItem호출시_dequeueStack이비어있다면_enqueueStack이비워진다() {
        // given
        let input = ["1", "2", "3"]
        let expectation = true
        
        // when
        input.forEach { sut.enqueueCurrentItem($0) }
        sut.dequeueCurrentItem()
        let result = sut.enqueueStack.isEmpty
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeueCurrentItem호출시_dequeueStack이비어있지않다면_dequeueStack의마지막값을반환한다() {
        // given
        let input = ["1", "2", "3", "4", "5"]
        let expectation = "2"
        
        // when
        input.forEach { sut.enqueueCurrentItem($0) }
        sut.dequeueCurrentItem()
        let result = sut.dequeueCurrentItem()
        
        // then
        XCTAssertEqual(result, expectation)
    }
}

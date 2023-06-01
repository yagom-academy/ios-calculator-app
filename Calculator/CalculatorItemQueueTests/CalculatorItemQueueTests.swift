//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Dasan on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_count_조건없이_queue의_count를호출할때_count는_0이다() {
        // given
        let expectation = 0
        
        //when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_count_queue_초기화시_head에_nil이들어갔을때_count는_0이다() {
        // given
        sut = CalculatorItemQueue(queue: LinkedList(head: nil))
        let expectation = 0
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_count_queue_초기화시_head에_Node를넣었을때_count는_1이다() {
        // given
        sut = CalculatorItemQueue(queue: LinkedList(head: Node(data: 1)))
        let expectation = 1
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
        
    func test_isEmpty_조건없이_queue의_isEmpty를호출할때_isEmpty는_true이다() {
        // given, when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty_queue_초기화시_head에_nil이들어갔을때_isEmpty는_true이다() {
        // given
        sut = CalculatorItemQueue(queue: LinkedList(head: nil))
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty_queue초기화시_head에_Node를넣었을때_isEmpty는_false이다() {
        // given
        sut = CalculatorItemQueue(queue: LinkedList(head: Node(data: 1)))
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_enqueue_enqueue_1을했을때_queue의_첫번째값은_1이다() {
        // given
        sut.enqueue(1)
        let expectation = 1
        
        // when
        let result = sut.queue.first
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue_enqueue_1_2_3을했을때_queue의_첫번째값은_1이다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        let expectation = 1
        
        // when
        let result = sut.queue.first
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue_enqueue_1을했을때_queue의_마지막값은_1이다() {
        // given
        sut.enqueue(1)
        let expectation = 1
        
        // when
        let result = sut.queue.last
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue_enqueue_1_2_3을했을때_queue의_마지막값은_3이다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        let expectation = 3
        
        // when
        let result = sut.queue.last
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_queue가_비어있을때_dequeue를하면_nil을_반환한다() {
        // given
        let expectation: Int? = nil
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_enqueue_1_2_3을하고_dequeue를하면_dequeue는_1을반환한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        let expectation = 1
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_enqueue_1_2_3을하고_dequeue를하면_queue의_첫번째값은_2이다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        let expectation = 2
        
        // when
        let _ = sut.dequeue()
        let result = sut.queue.first
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_isEmpty_enqueue_1을했을때_isEmpty는_false이다() {
        // given
        sut.enqueue(1)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isEmpty_enqueue_1을하고_dequeue를했을때_isEmpty는_true이다() {
        // given
        sut.enqueue(1)
        let _ = sut.dequeue()
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_count_enqueue_1_2_3을했을때_count는_3이다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        let expectation = 3
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_count_enqueue_1_2_3을하고_dequeue를했을때_count는_2이다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        let _ = sut.dequeue()
        let expectation = 2
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
}

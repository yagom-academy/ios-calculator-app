//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Harry on 2023/01/24.
//

import XCTest

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculaterItemQueue<Int>!
    
    override func setUpWithError() throws {
        sut = CalculaterItemQueue<Int>(queue: LinkedList<Int>())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    // MARK: - enqueue Test
    func test_enqueue호출시_queue의_count가_1증가한다() {
        // given
        let element = 1
        let expectation = sut.queue.count + 1

        // when
        sut.enqueue(element)
        let result = sut.queue.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue호출시_파라미터로_전달한값과_queue에추가된value가같다() {
        // given
        let expectation = 1

        // when
        sut.enqueue(1)
        let result = sut.queue.tail?.value
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    // MARK: - dequeue Test
    func test_dequeue호출시_queue의_count가0이면_nil반환한다() {
        let countExpectation = 0
        let dequeueExpectation: Int? = nil

        let countResult = sut.queue.count
        let dequeueResult = sut.dequeue()

        XCTAssertEqual(countResult, countExpectation)
        XCTAssertEqual(dequeueResult, dequeueExpectation)
    }

    func test_dequeue호출시_queue의_첫번쨰element를_제거하고_반환한다() {
        sut.queue.tail = Node(value: 3)
        sut.queue.head = Node(value: 1, next: Node(value: 2, next: sut.queue.tail))
        sut.queue.count = 3
        
        let returnExpectation = 1
        let queueCountExpectation = 2

        let dequeueReturn = sut.dequeue()
        let queueCount = sut.queue.count

        XCTAssertEqual(dequeueReturn, returnExpectation)
        XCTAssertEqual(queueCount, queueCountExpectation)
    }
    
    // MARK: - removeAll Test
    func test_removeAll호출시_queue의_head와_tail은_nil이다() {
        sut.queue.tail = Node(value: 3)
        sut.queue.head = Node(value: 1, next: Node(value: 2, next: sut.queue.tail))
        let headExpectation: Int? = nil
        let tailExpectation: Int? = nil
        
        sut.removeAll()
        let headValueResult = sut.queue.head?.value
        let tailValueResult = sut.queue.tail?.value
        
        XCTAssertEqual(headValueResult, headExpectation)
        XCTAssertEqual(tailValueResult, tailExpectation)
    }
    
    func test_removeAll호출시_queue의_count는_0이다() {
        sut.queue.count = 3
        let expectation = 0
        
        sut.removeAll()
        let result = sut.queue.count
        
        XCTAssertEqual(result, expectation)
    }
}

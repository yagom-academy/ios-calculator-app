//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Harry on 2023/01/24.
//

import XCTest

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Int>(list: LinkedList<Int>())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    // MARK: - enqueue Test
    func test_enqueue호출시_queue의_count가_1증가한다() {
        // given
        let element = 1
        let expectation = sut.list.count + 1

        // when
        sut.enqueue(element)
        let result = sut.list.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue호출시_파라미터로_전달한값과_queue에추가된value가같다() {
        // given
        let expectation = 1

        // when
        sut.enqueue(1)
        let result = sut.list.tail?.value
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    // MARK: - dequeue Test
    func test_dequeue호출시_queue의_count가0이면_nil반환한다() {
        let countExpectation = 0
        let dequeueExpectation: Int? = nil

        let countResult = sut.list.count
        let dequeueResult = sut.dequeue()

        XCTAssertEqual(countResult, countExpectation)
        XCTAssertEqual(dequeueResult, dequeueExpectation)
    }

    func test_dequeue호출시_queue의_첫번쨰element를_제거하고_반환한다() {
        sut.list.tail = Node(value: 3)
        sut.list.head = Node(value: 1, next: Node(value: 2, next: sut.list.tail))
        sut.list.count = 3
        
        let returnExpectation = 1
        let queueCountExpectation = 2

        let dequeueReturn = sut.dequeue()
        let queueCount = sut.list.count

        XCTAssertEqual(dequeueReturn, returnExpectation)
        XCTAssertEqual(queueCount, queueCountExpectation)
    }
    
    // MARK: - removeAll Test
    func test_removeAll호출시_queue의_head와_tail은_nil이다() {
        sut.list.tail = Node(value: 3)
        sut.list.head = Node(value: 1, next: Node(value: 2, next: sut.list.tail))
        let headExpectation: Int? = nil
        let tailExpectation: Int? = nil
        
        sut.removeAll()
        let headValueResult = sut.list.head?.value
        let tailValueResult = sut.list.tail?.value
        
        XCTAssertEqual(headValueResult, headExpectation)
        XCTAssertEqual(tailValueResult, tailExpectation)
    }
    
    func test_removeAll호출시_queue의_count는_0이다() {
        sut.list.count = 3
        let expectation = 0
        
        sut.removeAll()
        let result = sut.list.count
        
        XCTAssertEqual(result, expectation)
    }
}

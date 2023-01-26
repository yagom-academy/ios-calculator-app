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
        sut = CalculatorItemQueue<Int>(list: LinkedList())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - enqueue Test
    func test_enqueue호출시_queue의_count가_1증가한다() {
        // given
        let element = 1
        let expectedResult = sut.list.count + 1

        // when
        sut.enqueue(element)
        let result = sut.list.count
        
        // then
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_enqueue호출시_파라미터로_전달한값과_queue에추가된value가같다() {
        // given
        let expectedResult = 1

        // when
        sut.enqueue(1)
        let result = sut.list.head?.value
        
        // then
        XCTAssertEqual(result, expectedResult)
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

    func test_dequeue호출시_queue의_첫번째element를_제거하고_반환한다() {
        var list = LinkedList<Int>()
        list.appendLast(1)
        list.appendLast(2)
        list.appendLast(3)
        list.count = 3
        sut = CalculatorItemQueue(list: list)
        let returnExpectation = 1
        let queueCountExpectation = 2

        let dequeueReturn = sut.dequeue()
        let queueCount = sut.list.count

        XCTAssertEqual(dequeueReturn, returnExpectation)
        XCTAssertEqual(queueCount, queueCountExpectation)
    }
    
    // MARK: - removeAll Test
    func test_removeAll호출시_queue의_head와_tail은_nil이다() {
        var list = LinkedList<Int>()
        list.appendLast(1)
        list.appendLast(2)
        list.appendLast(3)
        list.count = 3
        sut = CalculatorItemQueue(list: list)
        let headExpectation: Int? = nil
        let tailExpectation: Int? = nil
        
        sut.removeAll()
        let headValueResult: Int? = sut.list.head?.value
        let tailValueResult: Int? = sut.list.tail?.value
        
        XCTAssertEqual(headValueResult, headExpectation)
        XCTAssertEqual(tailValueResult, tailExpectation)
    }
    
    func test_removeAll호출시_queue의_count는_0이다() {
        var list = LinkedList<Int>()
        list.appendLast(1)
        list.appendLast(2)
        list.appendLast(3)
        list.count = 3
        sut = CalculatorItemQueue(list: list)
        let expectedResult = 0
        
        sut.removeAll()
        let result = sut.list.count
        
        XCTAssertEqual(result, expectedResult)
    }
}

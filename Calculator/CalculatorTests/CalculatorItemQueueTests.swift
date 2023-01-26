//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Harry on 2023/01/24.
//

import XCTest

final class CalculatorItemQueueTests: XCTestCase {
    var sut: StubCalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        sut = StubCalculatorItemQueue<Int>(list: LinkedList())
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
        let result = sut.list.first as? Int
        
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
        sut.list.appendLast(1)
        sut.list.appendLast(2)
        sut.list.appendLast(3)
        let returnExpectation = 1
        let queueCountExpectation = 2

        let dequeueReturn = sut.dequeue()
        let queueCount = sut.list.count

        XCTAssertEqual(dequeueReturn, returnExpectation)
        XCTAssertEqual(queueCount, queueCountExpectation)
    }
    
    // MARK: - removeAll Test
    func test_removeAll호출시_queue의_head와_tail은_nil이다() {
        sut.list.appendLast(1)
        sut.list.appendLast(2)
        sut.list.appendLast(3)
        let headExpectation: Int? = nil
        let tailExpectation: Int? = nil
        
        sut.removeAll()
        let headValueResult: Int? = sut.list.first as? Int
        let tailValueResult: Int? = sut.list.last as? Int
        
        XCTAssertEqual(headValueResult, headExpectation)
        XCTAssertEqual(tailValueResult, tailExpectation)
    }
    
    func test_removeAll호출시_queue의_count는_0이다() {
        sut.list.count = 3
        let expectedResult = 0
        
        sut.removeAll()
        let result = sut.list.count
        
        XCTAssertEqual(result, expectedResult)
    }
}

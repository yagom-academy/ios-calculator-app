//
//  CalculatorItemQueueTests.swift
//  CalculatorTests
//
//  Created by JeongTaek Han on 2021/11/09.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {

    func test_비어있는큐에1_2_3넣으면첫번째위치로1반환() throws {
        // given
        var queue = CalculatorItemQueue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        // when
        let result = queue.front
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_비어있는큐에1_2_3넣고dequeue하면2반환() throws {
        // given
        var queue = CalculatorItemQueue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        // when
        let result = queue.dequeue()
        // then
        XCTAssertEqual(result, 2)
    }

}

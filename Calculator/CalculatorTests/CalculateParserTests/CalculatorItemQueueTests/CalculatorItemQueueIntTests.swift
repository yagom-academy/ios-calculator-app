//
//  CalculatorItemQueueIntTests.swift
//  CalculatorTests
//
//  Created by JeongTaek Han on 2021/11/09.
//

import XCTest

class CalculatorItemQueueIntTests: XCTestCase {
    
    var sutQueue: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        sutQueue = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sutQueue = nil
    }

    func test_1_2_3이_들어있는_큐에서_first를_호출하면_1을_반환하는가() {
        // given
        sutQueue.enqueue(1)
        sutQueue.enqueue(2)
        sutQueue.enqueue(3)
        // when
        let result = sutQueue.first
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_1_2_3이_들어있는_큐에서_dequeue를_호출하면_1을_반환하는가() {
        // given
        sutQueue.enqueue(1)
        sutQueue.enqueue(2)
        sutQueue.enqueue(3)
        // when
        let result = sutQueue.dequeue()
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_1_2_3이_들어있는_큐에서_한번_dequeue하고_first를_호출하면_2을_반환하는가() {
        // given
        sutQueue.enqueue(1)
        sutQueue.enqueue(2)
        sutQueue.enqueue(3)
        // when
        sutQueue.dequeue()
        let result = sutQueue.first
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_1_2_3이_들어있는_큐에서_count를_호출하면_3을_반환하는가() {
        // given
        sutQueue.enqueue(1)
        sutQueue.enqueue(2)
        sutQueue.enqueue(3)
        // when
        let result = sutQueue.count
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_빈_큐에서_count를_호출하면_0을_반환하는가() {
        // given
        // when
        let result = sutQueue.count
        // then
        XCTAssertEqual(result, 0)
    }
}

extension Int: CalculateItem { }

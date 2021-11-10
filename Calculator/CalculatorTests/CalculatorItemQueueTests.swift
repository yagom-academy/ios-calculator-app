//
//  CalculatorItemQueueTests.swift
//  CalculatorTests
//
//  Created by JeongTaek Han on 2021/11/09.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {

    func test_비어있는큐에1_2_3넣으면첫번째위치로1반환() {
        // given
        let queue = CalculatorItemQueue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        // when
        let result = queue.front
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_비어있는큐에1_2_3넣고dequeue하면1반환() {
        // given
        let queue = CalculatorItemQueue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        // when
        let result = queue.dequeue()
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_비어있는큐에1_2_3넣고dequeue하면맨앞에2반환() {
        // given
        let queue = CalculatorItemQueue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        // when
        queue.dequeue()
        let result = queue.front
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_비어있는큐에1_2_3넣고count하면3반환() {
        // given
        let queue = CalculatorItemQueue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        // when
        let result = queue.count
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_비어있는큐에count하면0반환() {
        // given
        let queue = CalculatorItemQueue<Int>()
        // when
        let result = queue.count
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_비어있는큐에더블타입10넣고제거하면부동소수점10반환() {
        // given
        let queue = CalculatorItemQueue<Double>()
        queue.enqueue(10)
        // when
        let result = queue.dequeue()
        // then
        XCTAssertEqual(result, 10.0)
    }
    
    func test_비어있는큐에문자덧셈기호넣고제거하면덧셈기호반환() {
        // given
        let queue = CalculatorItemQueue<Character>()
        queue.enqueue(Character("+"))
        // when
        let result = queue.dequeue()
        // then
        XCTAssertEqual(result, Character("+"))
    }
    
    func test_비어있는큐에isEmpty호출시true반환() {
        // given
        let queue = CalculatorItemQueue<Character>()
        // when
        let result = queue.isEmpty
        // then
        XCTAssertEqual(result, true)
    }
    
    func test_비어있는큐에isEmpty호출시false반환() {
        // given
        let queue = CalculatorItemQueue<Character>()
        queue.enqueue("+")
        // when
        let result = queue.isEmpty
        // then
        XCTAssertEqual(result, false)
    }

}

extension Int: CalculateItem { }

extension Character: CalculateItem { }

extension Double: CalculateItem { }

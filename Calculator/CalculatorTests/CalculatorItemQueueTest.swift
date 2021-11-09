//
//  CalculatorItemQueueTest.swift
//  CalculatorTests
//
//  Created by 이차민 on 2021/11/09.
//

import XCTest

class CalculatorItemQueueTest: XCTestCase {
    func test_enqueue_in_queue() {
        let queue = CalculatorItemQueue<Any>()
        queue.enqueue(3.5)
        queue.enqueue("+")
        queue.enqueue(4.5)
        XCTAssertEqual(3, queue.items.count)
    }
    
    func test_dequeue_in_empty_queue() {
        let queue = CalculatorItemQueue<Any>()
        queue.dequeue()
        XCTAssertEqual(nil, queue.items.first?.value as? Double)
    }
    
    func test_dequeue_in_not_empty_queue() {
        let queue = CalculatorItemQueue<Any>()
        queue.enqueue(3.5)
        queue.enqueue("+")
        queue.enqueue(4.5)
        queue.dequeue()
        queue.dequeue()
        XCTAssertEqual(4.5, queue.items.first?.value as? Double)
    }
    
    func test_dequeue_in_not_empty_queue_with_return_value() {
        let queue = CalculatorItemQueue<Any>()
        queue.enqueue(3.5)
        queue.enqueue("+")
        queue.enqueue(4.5)
        queue.dequeue()
        let value = queue.dequeue()
        XCTAssertEqual("+", value as? String)
    }
    
    func test_removeAll_in_queue() {
        let queue = CalculatorItemQueue<Any>()
        queue.enqueue(3.5)
        queue.enqueue("+")
        queue.enqueue(4.5)
        queue.removeAll()
        XCTAssertEqual(0, queue.items.count)
    }
}

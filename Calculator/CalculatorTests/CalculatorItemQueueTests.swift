//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Seul Mac on 2021/11/09.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {

    func test_빈queue_dequeue_1번() {
        var queue: CalculatorItemQueue = CalculatorItemQueue<Double>()
        let result = queue.dequeue()

        XCTAssertEqual(result, nil)
    }

    func test_피연산자_2개_enqueue_dequeue_1번() {
        var queue: CalculatorItemQueue = CalculatorItemQueue<Double>()
        queue.enqueue(2.0)
        queue.enqueue(1.0)

        XCTAssertEqual(queue.dequeue(), 2.0)
    }
    
    func test_연산자_2개_enqueue_dequeue_1번() {
        var queue: CalculatorItemQueue = CalculatorItemQueue<Operator>()
        queue.enqueue(Operator.divide)
        queue.enqueue(Operator.multiply)

        XCTAssertEqual(queue.dequeue(), Operator.divide)
    }
    
}

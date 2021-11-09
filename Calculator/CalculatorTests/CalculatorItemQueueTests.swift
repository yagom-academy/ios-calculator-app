//
//  CalculatorItemQueueTests.swift
//  CalculatorTests
//
//  Created by 이승재 on 2021/11/09.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {
    
    func testEnqueueAndDequeue() {
        var queue = CalculatorItemQueue<Double>()
        queue.enqueue(1.0)
        queue.enqueue(2.0)
        queue.enqueue(13.5)
        print("queue: \(queue)")
        XCTAssertEqual(queue.dequeue()!, 1.0)
        XCTAssertEqual(queue.dequeue()!, 2.0)
        XCTAssertEqual(queue.dequeue()!, 13.5)
        print("queue: \(queue)")
    }
    
    func testEnqueueAndRemoveLast() {
        var queue = CalculatorItemQueue<Double>()
        queue.enqueue(1.0)
        queue.enqueue(2.0)
        queue.enqueue(13.5)
        print("queue: \(queue)")
        XCTAssertEqual(queue.removeLast(), 13.5)
        XCTAssertEqual(queue.removeLast()!, 2.0)
        XCTAssertEqual(queue.removeLast()!, 1.0)
        print("queue: \(queue)")
    }
}

extension Double: CalculatorItem {
    
}

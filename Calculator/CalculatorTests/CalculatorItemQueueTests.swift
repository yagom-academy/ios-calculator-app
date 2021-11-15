//
//  CalculatorItemQueueTests.swift
//  CalculatorTests
//
//  Created by yeha on 2021/11/15.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {
    func test_큐에_Double_추가하기() {
        var queue = CalculatorItemQueue<Double>()
        queue.enqueue(1.0)
        queue.enqueue(-1.0)
        XCTAssertEqual(queue.items, [1.0, -1.0])
    }
    
    func test_큐에서_Double_삭제하기() {
        var queue = CalculatorItemQueue<Double>()
        queue.enqueue(1.0)
        queue.enqueue(-1.0)
        queue.dequeue()
        XCTAssertEqual(queue.items, [-1.0])
    }
    
    func test_큐를_비우기() {
        var queue = CalculatorItemQueue<Double>()
        queue.enqueue(1.0)
        queue.enqueue(-1.0)
        queue.clean()
        XCTAssertEqual(queue.items, [])
    }
}

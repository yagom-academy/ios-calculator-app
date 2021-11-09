//
//  CalculatorItemQueueTests.swift
//  CalculatorTests
//
//  Created by 이승재 on 2021/11/09.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {
    var queue = CalculatorItemQueue<Double>()
    
    override func setUp() {
        queue.enqueue(1.0)
        queue.enqueue(2.0)
        queue.enqueue(13.5)
    }
    
    override func tearDown() {
        queue = CalculatorItemQueue<Double>()
    }
    
    func testEnqueueAndDequeue() {
        XCTAssertEqual(try queue.dequeue(), 1.0)
        XCTAssertEqual(try queue.dequeue(), 2.0)
        XCTAssertEqual(try queue.dequeue(), 13.5)
    }
    
    func testEnqueueAndRemoveLast() {
        XCTAssertEqual(try queue.removeLast(), 13.5)
        XCTAssertEqual(try queue.removeLast(), 2.0)
        XCTAssertEqual(try queue.removeLast(), 1.0)
    }
    
    func testThrowError() {
        XCTAssertEqual(try queue.removeLast(), 13.5)
        XCTAssertEqual(try queue.removeLast(), 2.0)
        XCTAssertEqual(try queue.removeLast(), 1.0)
        XCTAssertThrowsError(try queue.dequeue())
        XCTAssertThrowsError(try queue.removeLast())
    }
    
}

extension Double: CalculatorItem {
    
}

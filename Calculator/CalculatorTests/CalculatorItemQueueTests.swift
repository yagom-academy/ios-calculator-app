//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이아리 on 2021/11/08.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {
    
    func test_첫번째요소() {
        var queue = CalculatorItemQueue<Int>()
        
        queue.enqueue(123)
        queue.enqueue(456)
        let node1 = queue.front
        let node2 = queue.dequeue()
        
        XCTAssertTrue(node1 == node2)
    }
    
    func test_요소가한개일때() {
        var queue = CalculatorItemQueue<Int>()
        
        queue.enqueue(123)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 1)
        
        let result = queue.dequeue()
        XCTAssertEqual(result, 123)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
    }
    
    func test_요소가두개일때() {
        var queue = CalculatorItemQueue<Int>()
        
        queue.enqueue(123)
        queue.enqueue(456)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 2)
        
        let result1 = queue.dequeue()
        XCTAssertEqual(result1, 123)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 1)
        
        let result2 = queue.dequeue()
        XCTAssertEqual(result2, 456)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
    }
    
    func test_요소가두개일때_clear호출() {
        var queue = CalculatorItemQueue<Int>()
        
        queue.enqueue(123)
        queue.enqueue(456)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 2)
        
        queue.clear()
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
    }
}

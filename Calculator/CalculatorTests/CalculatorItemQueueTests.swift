//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Ari on 2021/11/08.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {
    
    func test_enqueue() {
        var queue = CalculatorItemQueue<Double>([])
        
        queue.enqueue(123)
        XCTAssertEqual(queue.count, 1)
        
        queue.enqueue(456)
        XCTAssertEqual(queue.count, 2)
        
        queue.enqueue(789)
        XCTAssertEqual(queue.count, 3)
    }
    
    func test_dequeue() {
        var queue = CalculatorItemQueue<Double>([])
        
        queue.enqueue(123)
        XCTAssertEqual(queue.count, 1)
        
        do {
            let node1 = try queue.dequeue()
            XCTAssertNotNil(node1)
            XCTAssertEqual(node1, 123)
        } catch {
            print("에러")
        }
    }
    
    func test_첫번째요소() {
        var queue = CalculatorItemQueue<Double>([])
        
        queue.enqueue(123)
        queue.enqueue(456)
        let node1 = queue.front
        let node2: Double
        do {
            node2 = try queue.dequeue()
            XCTAssertTrue(node1 == node2)
        } catch {
            print("에러")
        }
    }
    
    func test_count() {
        var queue = CalculatorItemQueue<Double>([])
        
        queue.enqueue(123)
        queue.enqueue(456)
        
        XCTAssertEqual(queue.count, 2)

        try! queue.dequeue()
        XCTAssertEqual(queue.count, 1)
        
        try! queue.dequeue()
        XCTAssertEqual(queue.count, 0)
    }
    
    func test_isEmpty() {
        var queue = CalculatorItemQueue<Double>([])
        
        XCTAssertTrue(queue.isEmpty)
        
        queue.enqueue(123)
        queue.enqueue(456)
        
        try! queue.dequeue()
        XCTAssertFalse(queue.isEmpty)

        try! queue.dequeue()
        XCTAssertTrue(queue.isEmpty)
        
        queue.enqueue(123)
        XCTAssertFalse(queue.isEmpty)
        
        queue.clear()
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_요소가한개일때() {
        var queue = CalculatorItemQueue<Double>([])
        
        queue.enqueue(123)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 1)
        
        var result: Double = 0
        do {
            result = try queue.dequeue()
            XCTAssertEqual(result, 123)
        } catch {
            print("에러")
        }
        do {
            try queue.dequeue()
        } catch {
            print("에러")
        }
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
    }
    
    func test_요소가두개일때() {
        var queue = CalculatorItemQueue<Double>([])
        
        queue.enqueue(123)
        queue.enqueue(456)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 2)
        let result1: Double
        do {
            result1 = try queue.dequeue()
            XCTAssertEqual(result1, 123)
        } catch {
            print("에러")
        }
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 1)
        
        let result2: Double
        do {
            result2 = try queue.dequeue()
            XCTAssertEqual(result2, 456)
        } catch {
            print("에러")
        }
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
    }
    
    func test_요소가두개일때_clear호출() {
        var queue = CalculatorItemQueue<Double>([])
        
        queue.enqueue(123)
        queue.enqueue(456)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 2)
        
        queue.clear()
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
    }
}

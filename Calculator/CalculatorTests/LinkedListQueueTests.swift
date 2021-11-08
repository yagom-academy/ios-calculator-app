//
//  LinkedListQueueTests.swift
//  CalculatorTests
//
//  Created by 이아리 on 2021/11/08.
//

import XCTest

struct LinkedListQueue<T> {
    private var list = LinkedList<T>()
    
    var count: Int {
        return list.count
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var front: T? {
        return list.first?.value
    }
    
    func enqueue(_ element: T) {
        list.append(element)
    }
    
    func dequeue() -> T? {
        if list.isEmpty { return nil }
        return list.remove(at: 0)
    }
    
}

class LinkedListQueueTests: XCTestCase {
    
    func test_요소가한개일때() {
        let queue = LinkedListQueue<Int>()
        
        queue.enqueue(123)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 1)
        XCTAssertEqual(queue.front, 123)
        
        let result = queue.dequeue()
        XCTAssertEqual(result, 123)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
        XCTAssertEqual(queue.front, nil)
    }
    
    func test_요소가두개일때() {
        let queue = LinkedListQueue<Int>()
        
        queue.enqueue(123)
        queue.enqueue(456)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 2)
        XCTAssertEqual(queue.front, 123)
        
        let result1 = queue.dequeue()
        XCTAssertEqual(result1, 123)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 1)
        XCTAssertEqual(queue.front, 456)
        
        let result2 = queue.dequeue()
        XCTAssertEqual(result2, 456)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
        XCTAssertEqual(queue.front, nil)
    }
    
}

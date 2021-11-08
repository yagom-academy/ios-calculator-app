//
//  LinkedListTests.swift
//  CalculatorTests
//
//  Created by 이아리 on 2021/11/08.
//

import XCTest

final class LinkedList<T> {
    final class Node<T> {
        var value: T
        var next: Node?
        var prev: Node?
        
        init(value: T) {
            self.value = value
        }
    }
    var head: Node<T>?
    
    var first: Node<T>? {
        return head
    }
    
    var last: Node<T>? {
        guard var node = head else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return node
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    func append(_ value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.prev = last
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
}

class LinkedListTests: XCTestCase {
    let numbers = [1, 5, 14, 9, 6, 4]
    
    func test_비어있는리스트() {
        let list = LinkedList<Int>()
        XCTAssertTrue(list.isEmpty)
        XCTAssertEqual(list.count, 0)
        XCTAssertNil(list.first)
        XCTAssertNil(list.last)
    }
    
    func test_한개의요소() {
        let list = LinkedList<Int>()
        list.append(123)
        
        XCTAssertFalse(list.isEmpty)
        XCTAssertEqual(list.count, 1)
        
        XCTAssertNotNil(list.first)
        XCTAssertNil(list.head!.prev)
        XCTAssertNil(list.head!.next)
        XCTAssertEqual(list.head!.value, 123)
        
        XCTAssertNotNil(list.last)
        XCTAssertNil(list.last!.prev)
        XCTAssertNil(list.last!.next)
        XCTAssertEqual(list.last!.value, 123)
        
        XCTAssertTrue(list.head === list.last)
    }
    
    func test_두개의요소() {
        let list = LinkedList<Int>()
        list.append(123)
        list.append(456)
        
        XCTAssertEqual(list.count, 2)
        
        XCTAssertNotNil(list.first)
        XCTAssertEqual(list.head!.value, 123)
        
        XCTAssertNotNil(list.last)
        XCTAssertEqual(list.last!.value, 456)
        
        XCTAssertTrue(list.head !== list.last)
        
        XCTAssertNil(list.head!.prev)
        XCTAssertTrue(list.head!.next === list.last)
        XCTAssertTrue(list.last!.prev === list.head)
        XCTAssertNil(list.last!.next)
    }
    
}

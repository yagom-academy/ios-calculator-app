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

}

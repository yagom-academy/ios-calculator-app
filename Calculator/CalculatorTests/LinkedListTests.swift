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
    
    func node(at index: Int) -> Node<T> {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil { break }
            }
            return node!
        }
    }
    
    func remove(node: Node<T>) -> T {
        let prev = node.prev
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.prev = prev
        
        node.prev = nil
        node.next = nil
        
        return node.value
    }
    
    func remove(at index: Int) -> T {
        let node = self.node(at: index)
        return remove(node: node)
    }
    
    @discardableResult func removeLast() -> T {
        assert(!isEmpty)
        return remove(node: last!)
    }
    
    func removeAll() {
        head = nil
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
    
    func test_세개의요소() {
        let list = LinkedList<Int>()
        list.append(123)
        list.append(456)
        list.append(789)
        
        XCTAssertEqual(list.count, 3)
        
        XCTAssertNotNil(list.first)
        XCTAssertEqual(list.head!.value, 123)
        
        let second = list.head!.next
        XCTAssertNotNil(second)
        XCTAssertEqual(second!.value, 456)
        
        XCTAssertNotNil(list.last)
        XCTAssertEqual(list.last!.value, 789)
        
        XCTAssertNil(list.head!.prev)
        XCTAssertTrue(list.head!.next === second)
        XCTAssertTrue(second!.prev === list.head)
        XCTAssertTrue(second!.next === list.last)
        XCTAssertTrue(list.last!.prev === second)
        XCTAssertNil(list.last!.next)
    }
    
    func test_nodeIndex() {
        let list = LinkedList<Int>()
        list.append(123)
        
        let node = list.node(at: 0)
        XCTAssertNotNil(node)
        XCTAssertEqual(node.value, 123)
        XCTAssertTrue(node === list.head)
    }
    
    func test_nodeIndex가_2인경우() {
        let list = LinkedList<Int>()
        list.append(123)
        list.append(456)
        list.append(789)
        
        let node = list.node(at: 2)
        XCTAssertNotNil(node)
        XCTAssertEqual(node.value, 789)
        XCTAssertTrue(node === list.last)
    }
    
    func test_node를지우기() {
        let list = LinkedList<Int>()
        list.append(123)
        let node = list.head!
        
        let value = list.remove(node: node)
        
        XCTAssertEqual(value, 123)
        XCTAssertTrue(list.isEmpty)
        XCTAssertEqual(list.count, 0)
        XCTAssertNil(list.first)
        XCTAssertNil(list.last)
    }
    
    func test_node를_인덱스로지우기() {
        let list = LinkedList<Int>()
        list.append(123)
        
        let value = list.remove(at: 0)
        
        XCTAssertEqual(value, 123)
        XCTAssertTrue(list.isEmpty)
        XCTAssertEqual(list.count, 0)
        XCTAssertNil(list.first)
        XCTAssertNil(list.last)
    }
    
    func test_여러요소가있는리스트를_인덱스로_골라지우기() { //[1, 5, 14, 9, 6, 4]
        let list = LinkedList<Int>()
        for number in numbers {
            list.append(number)
        }
        
        let node = list.remove(at: 2)
        
        XCTAssertEqual(list.count, 5)
        XCTAssertTrue(node == 14)
    }
    
    func test_마지막요소_지우기() {
        let list = LinkedList<Int>()
        let numbers = [13, 22, 34]
        for number in numbers {
            list.append(number)
        }
        
        let node = list.removeLast()
        
        XCTAssertEqual(list.count, 2)
        XCTAssertTrue(node == 34)
        XCTAssertTrue(list.last?.value == 22)
        XCTAssertNotNil(list.last)
    }
    
    func test_모든요소_지우기() {
        let list = LinkedList<Int>()
        let numbers = [13, 22, 34]
        for number in numbers {
            list.append(number)
        }
        
        list.removeAll()
        
        XCTAssertEqual(list.count, 0)
        XCTAssertNil(list.last)
        XCTAssertNil(list.first)
    }
    
}

//
//  LinkedListTests.swift
//  CalculatorTests
//
//  Created by 이아리 on 2021/11/08.
//

import XCTest

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

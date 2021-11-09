//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이차민 on 2021/11/08.
//

import XCTest

class LinkedListTest: XCTestCase {
    func test_first_element_in_linkedList() {
        let list = LinkedList<Any>()
        list.appendNewNode(value: 3)
        list.appendNewNode(value: "+")
        list.appendNewNode(value: 4)
        XCTAssertEqual(3, list.first?.value as? Int)
    }
    
    func test_last_element_in_linkedList() {
        let list = LinkedList<Any>()
        list.appendNewNode(value: 3)
        list.appendNewNode(value: "+")
        list.appendNewNode(value: 4)
        XCTAssertEqual(4, list.last?.value as? Int)
    }
    
    func test_next_element_in_linkedList() {
        let list = LinkedList<Any>()
        list.appendNewNode(value: 3)
        list.appendNewNode(value: "+")
        list.appendNewNode(value: 4)
        XCTAssertEqual("+", list.head?.next?.value as? String)
    }
    
    func test_linkedList_is_empty() {
        let list = LinkedList<Any>()
        list.appendNewNode(value: 3)
        list.appendNewNode(value: "+")
        list.appendNewNode(value: 4)
        XCTAssertEqual(false, list.isEmpty)
    }
    
    func test_append_linkedList() {
        let list = LinkedList<Any>()
        list.appendNewNode(value: 3)
        list.appendNewNode(value: "+")
        list.appendNewNode(value: 4)
        XCTAssertEqual(3, list.count)
    }
    
    func test_remove_in_empty_linkedList() {
        let list = LinkedList<Any>()
        list.removeFirstNode()
        XCTAssertEqual(nil, list.head?.value as? Int)
    }
    
    func test_remove_in_not_empty_linkedList() {
        let list = LinkedList<Any>()
        list.appendNewNode(value: 3)
        list.appendNewNode(value: "+")
        list.removeFirstNode()
        XCTAssertEqual("+", list.first?.value as? String)
    }
    
    func test_remove_all_nodes_in_linkedList() {
        let list = LinkedList<Any>()
        list.appendNewNode(value: 3)
        list.appendNewNode(value: "+")
        list.removeAllNodes()
        XCTAssertEqual(0, list.count)
    }
}

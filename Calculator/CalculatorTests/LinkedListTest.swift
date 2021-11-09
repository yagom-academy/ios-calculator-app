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
        list.append(3)
        list.append(4)
        XCTAssertEqual(3, list.first)
    }
    
    func test_last_element_in_linkedList() {
        let list = LinkedList<Any>()
        list.append(3)
        list.append(4)
        XCTAssertEqual(4, list.last)
    }
    
    func test_next_element_in_linkedList() {
        let list = LinkedList<Any>()
        list.append(3)
        list.append(4)
        XCTAssertEqual(4, list.head?.next?.value)
    }
    
    func test_linkedList_is_empty() {
        let list = LinkedList<Any>()
        list.append(4)
        XCTAssertEqual(false, list.isEmpty)
    }
    
    func test_append_linkedList() {
        let list = LinkedList<Any>()
        list.append(3)
        list.append(4)
        list.append("TEST")
        XCTAssertEqual(2, list.count)
    }
    
    func test_remove_in_empty_linkedList() {
        let list = LinkedList<Any>()
        list.remove(at: 0)
        XCTAssertEqual(nil, list.first)
    }
    
    func test_remove_in_not_empty_linkedList() {
        let list = LinkedList<Any>()
        list.append(3)
        list.append("123")
        list.remove(at: 0)
        XCTAssertEqual("123", list.first)
    }
}

//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by jin on 9/19/22.
//

import XCTest
@testable import Calculator
class LinkedListTests: XCTestCase {
    
    var sut: LinkedList<String>!

    override func setUpWithError() throws {
        
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
        sut = nil
    }

    func test_linkedList_push_3_then_head_and_tail_is_3() {
        
        sut.push("3")
        
        XCTAssertEqual(sut.pop(), "3")
    }

    func test_linkedlist_append_4_then_tail_is_4() {
        
        sut.push("3")
        sut.append("4")
        
        XCTAssertEqual(sut.removeLast(), "4")
    }
    
    func test_linkedlist_append_4_when_there_is_no_head() {
        
        sut.append("4")
        
        XCTAssertEqual(sut.pop(), "4")
    }
    
    func test_linkedlist_pop_4_after_appending_4_5_6() {
        
        sut.append("4")
        sut.append("5")
        sut.append("6")
        
        XCTAssertEqual(sut.pop(), "4")
    }
    
    func test_linkedlist_removeLast_when_appending_4_5_6() {
        
        sut.append("4")
        sut.append("5")
        sut.append("6")
        
        sut.removeLast()
        
        let result1 = sut.pop()
        let result2 = sut.pop()
        
        XCTAssertEqual(result1, "4")
        XCTAssertEqual(result2, "5")
    }
    
    func test_linkedlist_removeLast_when_appending_only_4() {
        
        sut.append("6")
        
        let result = sut.removeLast()
        
        XCTAssertEqual(result, "6")
    }
    
    func test_removeAll_when_linkedlist_has_4_5_6() {
        
        sut.append("4")
        sut.append("5")
        sut.append("6")
        
        sut.removeAll()
        
        let headResult = sut.pop()
        let tailResult = sut.removeLast()
        
        XCTAssertEqual(headResult, nil)
        XCTAssertEqual(tailResult, nil)
    }
}

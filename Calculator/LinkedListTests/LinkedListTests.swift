//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by jin on 9/19/22.
//

import XCTest
@testable import Calculator
class LinkedListTests: XCTestCase {
    
    var sut: LinkedList<Double>!

    override func setUpWithError() throws {
        
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
        sut = nil
    }

    func test_linkedList_push_3_then_head_and_tail_is_3() {
        
        let input: Double = 3
        
        sut.push(input)
        
        XCTAssertEqual(sut.pop(), 3)
    }

    func test_linkedlist_append_4_then_tail_is_4() {
        
        let input: Double = 3
        let input2: Double = 4
        
        sut.push(input)
        sut.append(input2)
        
        XCTAssertEqual(sut.removeLast(), 4)
    }
    
    func test_linkedlist_append_4_when_there_is_no_head() {
        
        let input: Double = 4
        
        sut.append(input)
        
        XCTAssertEqual(sut.pop(), 4)
    }
    
    func test_linkedlist_pop_4_after_appending_4_5_6() {
        
        let input: Double = 4
        let input2: Double = 5
        let input3: Double = 6
        
        sut.append(input)
        sut.append(input2)
        sut.append(input3)
        
        XCTAssertEqual(sut.pop(), 4)
    }
    
    func test_linkedlist_removeLast_when_appending_4_5_6() {
        
        let input: Double = 4
        let input2: Double = 5
        let input3: Double = 6
        
        sut.append(input)
        sut.append(input2)
        sut.append(input3)
        
        sut.removeLast()
        
        let result1 = sut.pop()
        let result2 = sut.pop()
        
        XCTAssertEqual(result1, 4)
        XCTAssertEqual(result2, 5)
    }
    
    func test_linkedlist_removeLast_when_appending_only_4() {
        
        let input: Double = 6
        
        sut.append(input)
        
        let result = sut.removeLast()
        
        XCTAssertEqual(result, 6)
    }
    
    func test_removeAll_when_linkedlist_has_4_5_6() {
        
        let input: Double = 4
        let input2: Double = 5
        let input3: Double = 6
        
        sut.append(input)
        sut.append(input2)
        sut.append(input3)
        
        sut.removeAll()
        
        let headResult = sut.pop()
        let tailResult = sut.removeLast()
        
        XCTAssertEqual(headResult, nil)
        XCTAssertEqual(tailResult, nil)
    }
}

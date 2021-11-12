//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by JeongTaek Han on 2021/11/09.
//

import XCTest

class LinkedListTests: XCTestCase {
    
    var sutIntLinkedList: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sutIntLinkedList = LinkedList()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sutIntLinkedList = nil
    }
    
    func test_빈_LinkedList에_1을_append_했을때_0번_인덱스에_1이_존재하는가() {
        // given
        sutIntLinkedList.append(1)
        // when
        let result = sutIntLinkedList[0]
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_빈_LinkedList의_0번_인덱스에_subscript하면_nil을_반환하는가() {
        // given
        // when
        let result = sutIntLinkedList[0]
        // then
        XCTAssertNil(result)
    }
    
    func test_1만_들어있는_LinkedList의_1번_인덱스에_subscript하면_nil을_반환하는가() {
        // given
        sutIntLinkedList.append(1)
        // when
        let result = sutIntLinkedList[1]
        // then
        XCTAssertNil(result)
    }
    
    func test_1_2_3만_들어있는_LinkedList의_count는_3을_반환하는가() {
        // given
        sutIntLinkedList.append(1)
        sutIntLinkedList.append(2)
        sutIntLinkedList.append(3)
        // when
        let result = sutIntLinkedList.count
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_빈_LinkedList의_count는_0을_반환하는가() {
        // given
        // when
        let result = sutIntLinkedList.count
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_0만_들어있는_LinkedList의_removeFirst가_0을_반환하는가() {
        // given
        sutIntLinkedList.append(0)
        // when
        let result = sutIntLinkedList.removeFirst()
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_빈_LinkedList에서_removeFirst하면_nil을_반환하는가() {
        // given
        // when
        let result = sutIntLinkedList.removeFirst()
        // then
        XCTAssertNil(result)
    }
    
    func test_1_2만_들어있는_LinkedList의_removelast가_2를_반환하는가() {
        // given
        sutIntLinkedList.append(1)
        sutIntLinkedList.append(2)
        // when
        let result = sutIntLinkedList.removeLast()
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_1만_담겨있는_LinkedList에서_removeLast하면_1을_반환하는가() {
        // given
        sutIntLinkedList.append(1)
        // when
        let result = sutIntLinkedList.removeLast()
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_빈_LinkedList에서_removeLast하면_nil을_반환하는가() {
        // given
        // when
        let result = sutIntLinkedList.removeLast()
        // then
        XCTAssertNil(result)
    }
    
    func test_빈_LinkedList의_isEmpty가_true를_반환하는가() {
        // given
        // when
        let result = sutIntLinkedList.isEmpty
        // then
        XCTAssertEqual(result, true)
    }
    
    func test_2만_들어있는_LinkedList의_isEmpty가_false를_반환하는가() {
        // given
        sutIntLinkedList.append(2)
        // when
        let result = sutIntLinkedList.isEmpty
        // then
        XCTAssertEqual(result, false)
    }
    
    func test_1_2만_들어있는_LinkedList의_last가_2를_반환하는가() {
        // given
        sutIntLinkedList.append(1)
        sutIntLinkedList.append(2)
        // when
        let result = sutIntLinkedList.last
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_빈_LinkedList의_last가_nil를_반환하는가() {
        // given
        // when
        let result = sutIntLinkedList.last
        // then
        XCTAssertNil(result)
    }
    
    func test_1_2만_들어있는_LinkedList의_first가_1을_반환하는가() {
        // given
        sutIntLinkedList.append(1)
        sutIntLinkedList.append(2)
        // when
        let result = sutIntLinkedList.first
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_빈_LinkedList의_first가_nil를_반환하는가() {
        // given
        // when
        let result = sutIntLinkedList.first
        // then
        XCTAssertNil(result)
    }
}

//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Harry on 2023/01/25.
//

import XCTest

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        sut = LinkedList(count: 0)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_isEmpty접근시count가0일떄_true를반환한다() {
        // given
        sut.count = 0
        let expectation = true
        // when
        let result = sut.isEmpty
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_head가nil이면_appendLast호출시_새노드가_head가된다() {
        let headValue = 1
        let expectation = 1
        
        if sut.head == nil {
            sut.appendLast(headValue)
        }
        
        let result = sut.head?.value
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendLast호출시_head가있다면_tail뒤에_추가된다() {
        let headValue = 1
        let secondValue = 2
        sut.appendLast(headValue)
        sut.appendLast(secondValue)
        
        let result = sut.head?.next?.value
        
        XCTAssertEqual(secondValue, result)
    }
    
    func test_appendLast3번호출시_count가3이다() {
        sut.appendLast(1)
        sut.appendLast(2)
        sut.appendLast(3)
        let expectation = 3
        
        let result = sut.count
        
        XCTAssertEqual(result, expectation)
    }
    
}

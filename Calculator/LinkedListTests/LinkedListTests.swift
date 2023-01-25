//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Rowan on 2023/01/25.
//

import XCTest

final class LinkedListTests: XCTestCase {
    
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_isEmpty접근시count가0일때_true를반환한다() {
        // given
        sut.count = 0
        let expectation = true
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendLast호출시count가1증가한다() {
        // given
        let data = 1
        let expectation = 1
        
        // when
        sut.appendLast(data)
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendLast호출시_새Node를head로지정한다() {
        // given
        let input = 1
        let expectation = 1
        // when
        sut.appendLast(input)
        let result = sut.head?.data
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_() {
        // given
        
        
        // when
        
        
        // then
        
    }
    
    func test_3() {
        // given
        
        
        // when
        
        
        // then
        
    }
    
    
}

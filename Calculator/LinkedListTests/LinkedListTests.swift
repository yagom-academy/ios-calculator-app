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
    
    func test_() {
        // given
        
        // when
        
        // then
        
    }
}

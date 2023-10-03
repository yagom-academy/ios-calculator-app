//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by 김진주 on 2023/10/03.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Any>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Any>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_count가0일때_isEmpty가True인지() {
        // given
        sut.count = 0
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_count가0보다클때_isEmpty가False인지() {
        // given
        sut.count = 5
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_append호출시_isEmpty일때_head와tail에newNode가할당되는지() {
        // given
        
    }
}

//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by NAMU on 2022/05/17.
//

import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_append_값3개_추가하기() {
        // given
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        
        // when
        let result1 = sut.head?.data
        let result2 = sut.head?.next?.data
        let result3 = sut.head?.next?.next?.data
        
        // then
        XCTAssertEqual(result1, 1)
        XCTAssertEqual(result2, 2)
        XCTAssertEqual(result3, 3)
    }
}

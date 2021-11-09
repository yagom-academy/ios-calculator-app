//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by 황제하 on 2021/11/09.
//

import XCTest

class LinkedListTests: XCTestCase {
    var sut: LinkedList!
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_LinkedList의front가nil인지() {
        let front = sut.front
        
        XCTAssertEqual(front, nil)
    }

}

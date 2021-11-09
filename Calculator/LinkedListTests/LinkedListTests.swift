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
        
        XCTAssertNil(front)
    }

    func test_LinkedList에Node를추가해서front에nil이안나오게() {
        let node = Node()
        sut.add(front: node)
        
        XCTAssertEqual(sut.front, node)
    }
    
    func test_LinkedList의add함수의전달인자로value를넣어주고frontNode의value와같은지() {
        let value = 5
        sut.add(value: value)
        
        XCTAssertEqual(sut.front?.value, value)
    }
}

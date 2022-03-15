//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by 김태현 on 2022/03/15.
//

import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList(head: Node(data: 1))
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_append_빈queue에값넣었을때_head가첫노드인지() {
        let node = Node(data: 2)
        
        _ = sut?.removeFirst()
        sut?.append(node: node)
        
        XCTAssertEqual(node, sut?.head)
    }

    func test_sequence채택_고차함수사용가능한지() {
        sut?.append(node: Node(data: 2))

        let result: [Int] = sut!.map {test in test.data}

        XCTAssertEqual(result, [1, 2])
    }
}

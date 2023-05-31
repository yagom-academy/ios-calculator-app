//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Daehoon Lee on 2023/05/31.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList(head: Node(data: 0))
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

//    func test_init_head를기본값0을사용해초기화하고0을반환한다() {
//        // given
//        let expectedHead: Int = 0
//
//        // when
//        let testLinkedList: LinkedList = LinkedList()
//
//        // then
//        XCTAssertEqual(testLinkedList.head, expectedHead)
//    }
    
    func test_init_head를Node로초기화한다() {
        // given
        let expectedHead: Node = Node(data: 0)
        
        // when
        let testLinkedList: LinkedList = LinkedList(head: expectedHead)
        
        // then
        XCTAssertTrue(testLinkedList.head === expectedHead)
    }
    
    func test_init_head를nil로초기화한다() {
        // given
        let expectedHead: Node<Int>? = nil
        
        // when
        let testLinkedList: LinkedList = LinkedList(head: expectedHead)
        
        // then
        XCTAssertTrue(testLinkedList.head == expectedHead)
    }
}

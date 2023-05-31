//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Daehoon Lee on 2023/05/31.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
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
        XCTAssertTrue(testLinkedList.head === expectedHead)
    }
    
    func test_append_head가새로입력받은Node를반환한다() {
        // given
        let testNodeData: Int = 0
        let expectedHead: Node = Node(data: testNodeData)
        
        // when
        sut.append(testNodeData)
        
        // then
        XCTAssertTrue(sut.head === expectedHead)
    }
    
    func test_append_다음입력을받으면이전Node의next에다음Node를저장한다() {
        // given
        let firstNodeData: Int = 0
        let secondNodeData: Int = 1
        
        // when
        sut.append(firstNodeData)
        sut.append(secondNodeData)
        
        // then
        XCTAssertEqual(sut.head?.next?.data, secondNodeData)
    }
}

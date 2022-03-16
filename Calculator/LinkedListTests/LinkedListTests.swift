//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by 김태현 on 2022/03/15.
//

import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList(head: Node(data: 1))
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_isEmpty_true() {
        sut.head = nil
        
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_clear_빈리스트인지() {
        sut.clear()
        
        XCTAssertNil(sut.head)
    }
    
    func test_removeFirst_1제거되는지() {
        let result = sut.removeFirst()
        
        XCTAssertEqual(result, 1)
        XCTAssertNil(sut.head)
    }
    
    func test_append_2추가되는지() {
        let secondNode = Node(data: 2)
        var result: [Int] = []
        
        sut.append(node: secondNode)
        if let firstData = sut.removeFirst(),
           let secondData = sut.removeFirst() {
            result = [firstData, secondData]
        }
        
        XCTAssertEqual(result, [1, 2])
    }
    
    func test_append_빈queue에_2넣었을때_2있는지() {
        let node = Node(data: 2)
        
        _ = sut.removeFirst()
        sut.append(node: node)
        
        XCTAssertEqual(node.data, 2)
        XCTAssertNil(node.next)
        XCTAssertEqual(node, sut.head)
    }

    func test_sequence프로토콜_준수하는지() {
        sut.append(node: Node(data: 2))

        let result: [Int] = sut.map { test in test.data }

        XCTAssertEqual(result, [1, 2])
    }
}

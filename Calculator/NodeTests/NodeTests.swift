//
//  NodeTests.swift
//  NodeTests
//
//  Created by Daehoon Lee on 2023/05/30.
//

import XCTest
@testable import Calculator

final class NodeTests: XCTestCase {
    var sut: Node<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Node<Int>(data: 0, next: nil)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_init_0으로초기화한노드의_fetchData를호출하면_0을반환한다() {
        // given
        let expectedData: Int = 0
        sut = Node(data: expectedData)
        
        // when
        let result: Int = sut.fetchData()
        
        // then
        XCTAssertEqual(result, expectedData)
    }
    
    func test_init_더하기연산자로초기화한노드의_fetchData를호출하면_더하기연산자를반환한다() {
        // given
        let expectedData: String = "+"
        
        // when
        let testNode: Node = Node<String>(data: expectedData, next: nil)
        
        // then
        XCTAssertEqual(testNode.fetchData(), expectedData)
    }
    
    func test_init_1로초기화한nextNode를_다음Node로초기화한다() {
        // given
        let expectedData: Int = 0
        let expectedNext: Node = Node(data: 1)
        
        // when
        let testNode: Node = Node<Int>(data: expectedData, next: expectedNext)
        
        // then
        XCTAssertIdentical(testNode.fetchNext(), expectedNext)
    }
    
    func test_init_nextNode의전달인자없이초기화한다() {
        // given
        let expectedData: Int = 0
        
        // when
        let testNode: Node = Node<Int>(data: expectedData)
        
        // then
        XCTAssertTrue(testNode.fetchNext() == nil)
    }
    
    func test_deinit_이전Node대신nil을입력시_Node가해제되는지확인한다() {
        // when
        sut = nil
        
        // then
        XCTAssertNil(sut)
    }
}

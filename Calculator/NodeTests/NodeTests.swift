//
//  NodeTests.swift
//  NodeTests
//
//  Created by Daehoon Lee on 2023/05/30.
//

import XCTest
@testable import Calculator

final class NodeTests: XCTestCase {
    var sutForInt: Node<Int>!
    var sutForString: Node<String>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sutForInt = Node(data: 0, next: nil)
        sutForString = Node(data: "")
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sutForInt = nil
    }
    
    func test_init_0으로초기화한노드의_fetchData를호출하면_0을반환한다() {
        // given
        let expectedData: Int = 0
        sutForInt = Node(data: expectedData)
        
        // when
        let result: Int = sutForInt.fetchData()
        
        // then
        XCTAssertEqual(result, expectedData)
    }
    
    func test_init_더하기연산자로초기화한노드의_fetchData를호출하면_더하기연산자를반환한다() {
        // given
        let expectedData: String = "+"
        
        // when
        sutForString = Node(data: expectedData, next: nil)
        
        // then
        XCTAssertEqual(sutForString.fetchData(), expectedData)
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
}

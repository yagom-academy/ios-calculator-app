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
        sut = Node<Int>(data: 0)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_init_data를0으로초기화한다() {
        // given
        let expectedData = 0
        
        // when
        let testNode = Node<Int>(data: expectedData)
        
        // then
        XCTAssertEqual(testNode.data, expectedData)
    }
    
    func test_init_data를더하기연산자로초기화한다() {
        // given
        let expectedData = "+"
        
        // when
        let testNode = Node<String>(data: expectedData)
        
        // then
        XCTAssertEqual(testNode.data, expectedData)
    }
    
    func test_init_next를nil로초기화한다() {
        // given
        let expectedData = 0
        let expectedNext = nil
        
        // when
        let testNode = Node<Int>(data: expectedData, next: expectedNext)
        
        // then
        XCTAssertEqual(testNode.next, expectedNext)
    }
}

//
//  NodeTests.swift
//  NodeTests
//
//  Created by Derrick kim on 2022/05/17.
//

import XCTest
@testable import Calculator

class NodeTests: XCTestCase {
    var sut: Node<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Node(value: 0)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_Node는_값을_가진다() throws {
        // given
        let number: Double = 1.0
        let expectation: Double = 1.0
        // when
        sut.value = Double(number)
        
        // then
        let result = sut.value
        XCTAssertEqual(result, expectation)
    }
    
    func test_처음_Node는_이전_노드를_가지고있지않다() {
        // given
        // when
        let previous = sut.previous
        
        // then
        XCTAssertNil(previous)
    }
    
    func test_Node는_이전_노드를_가지고_있다() {
        // given
        // when
        sut.previous = Node(value: 3.0)
        
        // then
        let result = sut.previous
        XCTAssertNotNil(result)
    }
    
    func test_처음_Node는_다음_노드를_가지고있지않다() {
        // given
        // when
        let next = sut.next
        
        // then
        XCTAssertNil(next)
    }
    
    func test_Node는_다음_노드를_가지고_있다() {
        // given
        // when
        sut.next = Node(value: 3.0)
        
        // then
        let result = sut.next
        XCTAssertNotNil(result)
    }
    
}

//
//  NodeTests.swift
//  NodeTests
//
//  Created by kokkilE on 2023/01/25.
//

import XCTest
@testable import Calculator

final class NodeTests: XCTestCase {
    var sut: Node<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func test_같은_메모리를_참조하는_노드간의_비교연산_결과는_true이다() {
        // given
        sut = Node<String>("Testing...")
        let copiedNode = sut
        let expectation = true

        // when
        let result = sut == copiedNode

        // then
        XCTAssertEqual(result, expectation)
    }

    func test_다른_메모리를_참조하는_노드간의_비교연산_결과는_false이다() {
        // given
        sut = Node<String>("Testing...")
        let copiedNode = Node<String>("Testing...")
        let expectation = false

        // when
        let result = sut == copiedNode

        // then
        XCTAssertEqual(result, expectation)
    }
}

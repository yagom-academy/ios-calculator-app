//
//  NodeTests.swift
//  NodeTests
//
//  Created by kokkilE on 2023/01/25.
//

import XCTest
@testable import Calculator

final class NodeTests: XCTestCase {
    var sutIntNode: Node<Double>!
    var sutStringNode: Node<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sutIntNode = nil
        sutStringNode = nil
    }
    
    func test_정수타입_데이터를_받았을때_dataType이_CalculatorDataType_numberData이다() {
        // given
        sutIntNode = Node<Double>(10)
        let expectation = CalculatorDataType.numberData

        // then
        XCTAssertEqual(sutIntNode?.dataType, expectation)
    }
    
    func test_문자열타입_데이터를_받았을때_dataType이_CalculatorDataType_numberData이다() {
        // given
        sutStringNode = Node<String>("Testing...")
        let expectation = CalculatorDataType.operatorData

        // then
        XCTAssertEqual(sutStringNode?.dataType, expectation)
    }
    
    func test_같은_메모리를_참조하는_노드간의_비교연산_결과는_true이다() {
        // given
        sutStringNode = Node<String>("Testing...")
        let copiedNode = sutStringNode
        let expectation = true
        
        // when
        let result = sutStringNode == copiedNode

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_다른_메모리를_참조하는_노드간의_비교연산_결과는_true이다() {
        // given
        sutStringNode = Node<String>("Testing...")
        let copiedNode = Node<String>("Testing...")
        let expectation = false
        
        // when
        let result = sutStringNode == copiedNode

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_같은_메모리를_참조하는_노드간의_XCTAssertEqual_결과는_pass이다() {
        // given
        sutStringNode = Node<String>("Testing...")
        let copiedNode = sutStringNode

        // then
        XCTAssertEqual(sutStringNode, copiedNode)
    }
}

//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 김태현 on 2022/03/14.
//

import XCTest
@testable import Calculator

fileprivate struct MockNode {
    static var mockInt = Node(data: CalculatorItem.integer(10))
    static var mockOperator = Node(data: CalculatorItem.operator(.devision))
    static var mockDouble = Node(data: CalculatorItem.double(3.5))
}

final class CalculatorItemQueueTests: XCTestCase {
    private var sut: CalculatorItemQueue<CalculatorItem>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue(node: MockNode.mockInt)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        MockNode.mockDouble.next = nil
        MockNode.mockInt.next = nil
        MockNode.mockOperator.next = nil
    }
    
    private func test_enqueue_node2개_추가됐는지() {
        sut.enqueue(MockNode.mockOperator)
        sut.enqueue(MockNode.mockDouble)
        
        let firstNode = sut.linkedList.head
        let secondNode = firstNode?.next
        let thirdNode = secondNode?.next
        
        XCTAssertEqual(firstNode, MockNode.mockInt)
        XCTAssertEqual(secondNode, MockNode.mockOperator)
        XCTAssertEqual(thirdNode, MockNode.mockDouble)
    }
    
    private func test_clear_head가_nil인지() {
        let oldHead = sut.linkedList.head
        
        sut.clear()
        
        XCTAssertEqual(oldHead, MockNode.mockInt)
        XCTAssertNil(sut.linkedList.head)
    }

    private func test_dequeue_빈queue인지() {
        let result = sut.dequeue()
        
        let firstNode = sut.linkedList.head
        
        XCTAssertEqual(result, MockNode.mockInt.data)
        XCTAssertEqual(firstNode, nil)
        XCTAssertTrue(sut.isEmpty())
    }
    
    private func test_sequence프로토콜_준수하는지() {
        sut.enqueue(MockNode.mockOperator)
        sut.enqueue(MockNode.mockDouble)

        let result: [CalculatorItem] = sut.map { $0.data }
        let expectation = [CalculatorItem.integer(10), CalculatorItem.operator(.devision), CalculatorItem.double(3.5)]

        XCTAssertEqual(result, expectation)
    }
}

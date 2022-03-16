//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 김태현 on 2022/03/14.
//

import XCTest
@testable import Calculator

struct MockNode {
    static var mockInt = Node(data: CalculatorItem.integer(10))
    static var mockOperator = Node(data: CalculatorItem.operator(.devision))
    static var mockDouble = Node(data: CalculatorItem.double(3.5))
}

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<CalculatorItem>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.sut = CalculatorItemQueue(node: MockNode.mockInt)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        self.sut = nil
        MockNode.mockDouble.next = nil
        MockNode.mockInt.next = nil
        MockNode.mockOperator.next = nil
    }
    
    func test_enqueue_node2개추가됐는지() {
        sut.enqueue(MockNode.mockOperator)
        sut.enqueue(MockNode.mockDouble)
        
        let firstNode = sut.linkedList.head
        let secondNode = firstNode!.next
        let thirdNode = secondNode!.next
        
        XCTAssertEqual(firstNode, MockNode.mockInt)
        XCTAssertEqual(secondNode, MockNode.mockOperator)
        XCTAssertEqual(thirdNode, MockNode.mockDouble)
    }
    
    func test_clear_head가nil인지() {
        let oldHead = sut.linkedList.head
        
        sut.clear()
        
        XCTAssertEqual(oldHead, MockNode.mockInt)
        XCTAssertNil(sut.linkedList.head)
    }

    func test_dequeue_빈queue인지() {
        let result = sut.dequeue()
        
        let firstNode = sut.linkedList.head
        
        XCTAssertEqual(result, MockNode.mockInt.data)
        XCTAssertEqual(firstNode, nil)
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_sequence채택_고차함수사용가능한지() {
        sut.enqueue(MockNode.mockOperator)
        sut.enqueue(MockNode.mockDouble)

        let result: [CalculatorItem] = sut.map { $0.data }
        let expectation = [CalculatorItem.integer(10), CalculatorItem.operator(.devision), CalculatorItem.double(3.5)]

        XCTAssertEqual(result, expectation)
    }
}

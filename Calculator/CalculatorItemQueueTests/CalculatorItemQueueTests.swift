//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 김태현 on 2022/03/14.
//

import XCTest
@testable import Calculator

struct MockNode {
    static let mockInt = Node(data: CalculatorItem.integer(10))
    static let mockOperator = Node(data: CalculatorItem.operator(.devision))
    static let mockDouble = Node(data: CalculatorItem.double(3.5))
}

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.sut = CalculatorItemQueue(node: MockNode.mockInt)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        self.sut = nil
    }
    
    func test_enqueue_node2개추가됐는지() {
        sut.enqueue(MockNode.mockOperator)
        sut.enqueue(MockNode.mockDouble)
        
        let firstNode = sut.queue.head
        let secondNode = firstNode!.next
        let thirdNode = secondNode!.next
        
        XCTAssertEqual(firstNode, MockNode.mockInt)
        XCTAssertEqual(secondNode, MockNode.mockOperator)
        XCTAssertEqual(thirdNode, MockNode.mockDouble)
    }
    
    func test_clear_head가nil인지() {
        let lastHead = sut.queue.head
        
        sut.clear()
        
        XCTAssertEqual(lastHead, MockNode.mockInt)
        XCTAssertNil(sut.queue.head)
    }

    func test_dequeue_빈queue인지() {
        let result = sut.dequeue()
        
        let firstNode = sut.queue.head
        
        XCTAssertEqual(result, MockNode.mockInt.data)
        XCTAssertEqual(firstNode, nil)
        XCTAssertTrue(sut.isEmpty())
    }
}

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
        sut = CalculatorItemQueue(linkedList: LinkedList<CalculatorItem>())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        MockNode.mockDouble.next = nil
        MockNode.mockInt.next = nil
        MockNode.mockOperator.next = nil
    }
    
    func test_isEmpty_true인지() {
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }
    
    func test_enqueue_isEmpty_false인지() {
        sut.enqueue(MockNode.mockOperator)
        
        XCTAssertFalse(sut.isEmpty())
    }
    
    func test_clear_isEmpty_true인지() {
        sut.enqueue(MockNode.mockOperator)
        
        sut.clear()
        
        XCTAssertTrue(sut.isEmpty())
    }

    func test_dequeue_빈queue인지() {
        sut.enqueue(MockNode.mockInt)
        let result = sut.dequeue()
        
        XCTAssertEqual(result, MockNode.mockInt.data)
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_sequence프로토콜_준수하는지() {
        sut.enqueue(MockNode.mockInt)
        sut.enqueue(MockNode.mockOperator)
        sut.enqueue(MockNode.mockDouble)

        let result: [CalculatorItem] = sut.map { $0.data }
        let expectation = [CalculatorItem.integer(10), CalculatorItem.operator(.devision), CalculatorItem.double(3.5)]

        XCTAssertEqual(result, expectation)
    }
}

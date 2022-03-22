//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 김태현 on 2022/03/14.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    private var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_isEmpty_true인지() {
        let result = sut.isEmpty()
        
        XCTAssertTrue(result)
    }
    
    func test_enqueue_isEmpty_false인지() {
        sut.enqueue(Node(data: 3.0))
        
        XCTAssertFalse(sut.isEmpty())
    }
    
    func test_clear_isEmpty_true인지() {
        sut.enqueue(Node(data: 3.0))
        
        sut.clear()
        
        XCTAssertTrue(sut.isEmpty())
    }

    func test_dequeue_빈queue인지() throws {
        sut.enqueue(Node(data: 3.0))
        let result = try sut.dequeue()
        
        XCTAssertEqual(result, 3.0)
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_makeIterator_차례대로_node반환하는지() {
        let head = Node(data: 1.0)
        let nextNode = Node(data: 2.0)
        sut.enqueue(head)
        sut.enqueue(nextNode)
        
        let result = sut.makeIterator().current
        let nextResult = sut.makeIterator().current?.next
        
        XCTAssertEqual(result, head)
        XCTAssertEqual(nextResult, nextNode)
    }
}

//  CalculatorItemQueueTests - CalculatorItemQueueTests.swift
//  created by vetto on 2023/01/25

import XCTest

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<String>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // isEmpty computed property test
    func test_head가_nil일_때_isQueueEmpty호출하면_true이다() {
        let result = sut.isEmpty
        let expectation = true
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_CalculatorItemQueue에_Node를_추가하고_isQueueEmpty호출하면_false이다() {
        sut.head = Node(data: "head")
        
        let result = sut.isEmpty
        let expectation = false
        
        XCTAssertEqual(result, expectation)
    }
    
    // size computed property test
    func test_빈_queue에서_size를_호출하면_0이다() {
        let result = sut.size
        let expectation = 0
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_queue에_Node를_1개넣고_size를_호출하면_1이다() {
        let headNode: Node = Node(data: "head")
        
        sut.head = headNode
        
        let result = sut.size
        let expectation = 1
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_queue에_Node를_2개넣고_size를_호출하면_2이다() {
        let headNode: Node = Node(data: "head")
        let nextNode: Node = Node(data: "next")
        
        sut.head = headNode
        sut.head?.next = nextNode
        
        let result = sut.size
        let expectation = 2
        
        XCTAssertEqual(result, expectation)
    }
}

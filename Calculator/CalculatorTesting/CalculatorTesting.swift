//
//  CalculatorTesting.swift
//  CalculatorTesting
//
//  Created by 유제민 on 2022/09/20.
//

import XCTest
@testable import Calculator
class CalculatorTesting: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_queue_append_firstElement_isSucessfull() {
        sut.append(newNode: Node(value: 10))
        
        XCTAssertEqual(sut.head?.value, 10)
        XCTAssertNil(sut.head?.next)
    }
    
    func test_queue_after_appending_secondElement_FirstNode_next_equal_to_nextNode() {
        
        sut.append(newNode: Node(value: 20))
        sut.append(newNode: Node(value: 30))
        sut.append(newNode: Node(value: 40))
        
        XCTAssertNotNil(sut.head?.next)
    }
    
    func test_queue_getFirst_returns_head_sucessfully() {
        
        
        sut.append(newNode: Node(value: 20))
        sut.append(newNode: Node(value: 30))
        sut.append(newNode: Node(value: 40))
        
        XCTAssertEqual(sut.getFirst()?.value, 20)
    }
    
    func test_queue_after_removeAll_head_and_tail_returns_nil() {
        
        sut.append(newNode: Node(value: 20))
        sut.append(newNode: Node(value: 30))
        sut.append(newNode: Node(value: 40))
        
        sut.removeAll()
        
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
}

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
        sut.append(newNode: Node(value: 10))
        sut.append(newNode: Node(value: 20))
        sut.append(newNode: Node(value: 30))
        sut.append(newNode: Node(value: 40))
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_queue_append_firstElement_isSucessfull() {

        XCTAssertEqual(sut.head?.value, 10)
        XCTAssertNil(sut.head?.next)
    }
    
    func test_queue_after_appending_secondElement_FirstNode_next_equal_to_nextNode() {

        XCTAssertNotNil(sut.head?.next)
    }
    
    func test_queue_getFirst_returns_head_sucessfully() {
        
        XCTAssertEqual(sut.getFirst()?.value, 10)
    }
    
    func test_queue_after_removeAll_head_and_tail_returns_nil() {
        
        sut.removeAll()
        
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
}

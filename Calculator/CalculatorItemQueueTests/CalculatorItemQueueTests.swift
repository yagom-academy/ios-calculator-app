//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by jin on 9/19/22.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    
    func test_when_enqueue_3_then_linkedlist_has_3() {

        let input = "3"
        
        sut.enqueue(item: input)
        
        XCTAssertEqual(sut.dequeue(), "3")
    }

    func test_when_dequeue_3_when_linkedlist_has_3_4_5() {
        
        let input = "3"
        let input2 = "4"
        let input3 = "5"
        
        sut.enqueue(item: input)
        sut.enqueue(item: input2)
        sut.enqueue(item: input3)

        XCTAssertEqual(sut.dequeue(), "3")
    }
    
    func test_when_linkedlist_has_3_4_5_removeAll() {
        
        let input = "3"
        let input2 = "4"
        let input3 = "5"
        
        sut.enqueue(item: input)
        sut.enqueue(item: input2)
        sut.enqueue(item: input3)
        
        sut.removeAll()
        
        XCTAssertEqual(sut.isEmpty(), true)
    }
}

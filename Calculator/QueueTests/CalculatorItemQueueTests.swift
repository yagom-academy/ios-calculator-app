//
//  QueueTests.swift
//  QueueTests
//
//  Created by 고은 on 2021/11/09.
//

import XCTest

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
    
    func test_enqueue로_value를넣고_dequeue를호출했을때_test_Elements가_nil배열을반환하는지() {
        sut.enqueue("6")
        
        sut.dequeue()
        
        XCTAssertEqual(sut.test_Elements(), [])
    }
}

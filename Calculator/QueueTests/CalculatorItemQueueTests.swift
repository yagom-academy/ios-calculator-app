//
//  QueueTests.swift
//  QueueTests
//
//  Created by 고은 on 2021/11/09.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String, CalculateItem>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String, CalculateItem>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enque로_value를넣으면_비어있지않은배열을반환하는지() {
        sut.enqueue("9")
        
        XCTAssertNotEqual(sut.elements(), [])
    }
    
    func test_하나의값이있는자료에_dequeue를호출했을때_elements가_nil배열을반환하는지() {
        sut.enqueue("6")
        
        sut.dequeue()
        
        XCTAssertEqual(sut.elements(), [])
    }
}

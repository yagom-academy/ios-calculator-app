//
//  CalculatorItemQueueTests.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/10.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Any>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testCalculatorItemQueueEnqueue_givenNewInteger_expectNotEmpty() {
        let newData = 10
        sut.enqueue(newData)
        XCTAssertTrue(sut.isNotEmpty)
    }
    
    func testCalculatorItemQueueDequeue_givenNewInteger_expectFirstItemEqualToInsertedItem() {
        let newData = 10
        sut.enqueue(newData)
        let removedItem = sut.dequeue()
        XCTAssertEqual(removedItem, newData)
    }
}

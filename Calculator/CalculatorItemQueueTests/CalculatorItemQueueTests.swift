//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by jin on 9/19/22.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue!

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
        XCTAssertEqual(sut.queue.head?.value, "3")
    }

    func test_when_dequeue_3_when_linkedlist_has_3_4_5() {
        sut.enqueue(item: "3")
        sut.enqueue(item: "4")
        sut.enqueue(item: "5")

        XCTAssertEqual(sut.dequeue(), "3")
    }
}

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

    
    func test_인큐에_3을_넣었을때_큐에_3이_들어가는지() {
        // given
        let input = "3"
        // when
        sut.enqueue(item: input)
        // then
        XCTAssertEqual(["3"], sut.queue)
    }

}

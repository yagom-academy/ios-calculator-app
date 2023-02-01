//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by kokkilE on 2023/01/25.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>?

    override func setUpWithError() throws {
        try super.setUpWithError()

        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()

        sut = nil
    }

    func test_비어있는큐에서_enqueueCalculateItems2회호출시_count는2이다() {
        // given
        let input1 = Node(10.0)
        let input2 = Node(20.0)
        sut?.enqueueCalculateItems(input1)
        sut?.enqueueCalculateItems(input2)
        let expectation = 2

        // when
        let result = sut?.calculateItemsCount

        // then
        XCTAssertEqual(result, expectation)
    }

    func test_비어있는큐에서_dequeueCalculateItems호출시_nil반환한다() {
        // given
        let input = sut?.dequeueCalculateItems()

        // when / then
        XCTAssertEqual(input, nil)
    }

    func test_비어있지않은큐에서_dequeueCalculateItems호출시_먼저enqueue된데이터를반환한다() {
        // given
        let input1 = Node(10.0)
        let input2 = Node(20.0)
        sut?.enqueueCalculateItems(input1)
        sut?.enqueueCalculateItems(input2)
        let expectation = input1

        // when
        let result = sut?.dequeueCalculateItems()

        // when / then
        XCTAssertEqual(result, expectation)
    }

    func test_비어있지않은큐에서_dequeueCalculateItems호출시_count가감소한다() {
        // given
        let input1 = Node(10.0)
        let input2 = Node(20.0)
        sut?.enqueueCalculateItems(input1)
        sut?.enqueueCalculateItems(input2)
        var expectation = 2

        // when
        var result = sut?.calculateItemsCount

        // then
        XCTAssertEqual(result, expectation)

        // given
        expectation = 1

        // when
        _ = sut?.dequeueCalculateItems()
        result = sut?.calculateItemsCount

        // then
        XCTAssertEqual(result, expectation)
    }
}

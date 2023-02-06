//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by kaki on 2023/01/25.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_dequeue_됐을경우_처음에_enqueue_해준_데이터가_반환된다() {
        // given
        sut.enqueue(111)
        sut.enqueue(222)
        sut.enqueue(333)
        let expectation: Double = 111
        // when
        let result = sut.dequeue()!
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_빈queue를_dequeue_할경우_nil이_반환된다() {
        // given
        let expectation: Double? = nil
        // when
        let result = sut.dequeue()
        // then
        XCTAssertEqual(result, expectation)
    }
}

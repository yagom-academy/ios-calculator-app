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
    
    func test_큐가_비었을경우_isEmpty가_true이다() {
        // given
        let expectation = true
        // when
        let result = sut.isEmpty
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_큐가_비었을경우_size가_0이다() {
        // given
        let expectation = 0
        // when
        let result = sut.size
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue_됐을경우_isEmpty가_false이다() {
        // given
        let expectation = false
        // when
        sut.enqueue(111)
        let result = sut.isEmpty
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_한번_enqueue_됐을경우_size가_1이다() {
        // given
        let expectation = 1
        // when
        sut.enqueue(111)
        let result = sut.size
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_세번_enqueue_됐을경우_size가_3이다() {
        // given
        let expectation = 3
        // when
        sut.enqueue(111)
        sut.enqueue(222)
        sut.enqueue(333)
        let result = sut.size
        // then
        XCTAssertEqual(result, expectation)
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
    
    func test_dequeue_됐을경우_size가_감소한다() {
        // given
        sut.enqueue(111)
        sut.enqueue(222)
        sut.enqueue(333)
        let expectation = 2
        // when
        let _ = sut.dequeue()
        let result = sut.size
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
    
    func test_3개의_queue에서_clear를_한경우_isEmpty는_true이다() {
        // given
        sut.enqueue(111)
        sut.enqueue(222)
        sut.enqueue(333)
        let expectation = true
        // when
        sut.clear()
        let result = sut.isEmpty
        // then
        XCTAssertEqual(result, expectation)
    }

}

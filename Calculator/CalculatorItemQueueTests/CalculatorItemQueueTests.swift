//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by seohyeon park on 2022/05/17.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    // MARK: Setting
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    // MARK: Test_enqueue()
    func testCalculateItems에_요소가_잘_추가되는지() {
        // given
        sut.enqueue(3.0)
        // when
        let result = sut.calculateItems[0]
        // then
        XCTAssertEqual(result, 3.0)
    }
    
    // MARK: Test_dequeue()
    func testCalculateItems의_요소가_잘_빠지는지() {
        // given
        sut.enqueue(3.0)
        // when
        let result = sut.dequeue()
        // then
        XCTAssertEqual(result, 3.0)
    }
    
    func testCalculateItem의_첫번째_요소가_잘_빠지는지() {
        // given
        sut.enqueue(3.0)
        sut.enqueue(4.0)
        sut.enqueue(5.0)
        // when
        let result = sut.dequeue()
        // then
        XCTAssertEqual(result, 3.0)
    }
    
    func testCalculateItem이_비어있을_때_요소를_빼려하면_nil이_반환되는지() {
        // given when
        let result = sut.dequeue()
        // then
        XCTAssertEqual(result, nil)
    }
    
    // MARK: Test_resetQueue()
    func testCalculateItem이_잘_초기화가_되는지() {
        // given
        sut.enqueue(3.0)
        sut.enqueue(4.0)
        sut.enqueue(5.0)
        // when
        sut.resetQueue()
        let result = sut.calculateItems.count
        // then
        XCTAssertEqual(result, 0)
    }
    
    // MARK: Test_peak()
    func testCalculateItem의_첫번째_요소가_그대로_들어있고_값만_반환되는지() {
        // given
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        // when
        let firstElement = sut.peak()
        let result = sut.calculateItems.count
        // then
        XCTAssertEqual(firstElement, 1)
        XCTAssertEqual(result, 3)
    }
    
    func testCalculateItem이_비어있을_때_peak를_하면_nil이_반환되는지() {
        // given when
        let result = sut.peak()
        // then
        XCTAssertEqual(result, nil)
    }
    
    // MARK: Test_isEmpty()
    func testCalculateItem이_비어있을_때_true가_반환되는지() {
        // given when
        let result = sut.isEmpty()
        // then
        XCTAssertEqual(result, true)
    }
    
    // MARK: Test_head
    func testCalculateItem이_비어있을_때_head가_마이너스1이_되는지1() {
        // given
        sut.enqueue(1.0)
        sut.resetQueue()
        // when
        let result = sut.head
        // then
        XCTAssertEqual(result, -1)
    }
    
    func testCalculateItem이_비어있을_때_head가_마이너스1이_되는지2() {
        // given
        sut.enqueue(1.0)
        _ = sut.dequeue()
        // when
        let result = sut.head
        // then
        XCTAssertEqual(result, -1)
    }
    
    func testCalculateItem이_비어있을_때_head가_마이너스1이_되는지3() {
        // given
        _ = sut.peak()
        // when
        let result = sut.head
        // then
        XCTAssertEqual(result, -1)
    }
    
    func testCalculateItem이_안비어있고_calculateItem의_인덱스가_head보다_클때_head가_플러스1이_되는지() {
        // given
        sut.enqueue(1.0)
        _ = sut.peak()
        // when
        let result = sut.head
        // then
        XCTAssertEqual(result, 0)
    }
    
    func testCalculateItem의_인덱스보다_head_값이_클_때_head가_인덱스마지막을_가리키는지() {
        // given
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        _ = sut.peak()
        _ = sut.peak()
        _ = sut.dequeue()
        _ = sut.peak()
        // when
        let result = sut.head
        // then
        XCTAssertEqual(result, sut.calculateItems.count-1)
    }
}

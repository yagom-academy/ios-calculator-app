//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by seohyeon park on 2022/05/17.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testCalculateItems에_요소가_잘_추가되는지() {
        // given
        sut.enqueue(3.0)
        // when
        let result = sut.calculateItems[0]
        // then
        XCTAssertEqual(result, 3.0)
    }
    
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
    
    func testCalculateItem이_비어있을_때_nil이_반환되는지() {
        // given when
        let result = sut.dequeue()
        // then
        XCTAssertEqual(result, nil)
    }
}

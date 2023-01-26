//  CalculatorItemQueueTest.swift
//  Created by 레옹아범 on 2023/01/24.

import XCTest
@testable import Calculator

final class CalculatorItemQueueTest: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_a를_enqueue한다면_peek는_a다() {
        // given
        let value = "a"
        let exception = "a"
        // when
        sut.enqueue(value)
        let peekValue = sut.peek!
        // then
        XCTAssertEqual(peekValue, exception)
    }
    
    func test_a와_b를_enqueue한다면_back은_b다() {
        // given
        let firstValue = "a"
        let secondValue = "b"
        let exception = "b"
        // when
        sut.enqueue(firstValue)
        sut.enqueue(secondValue)
        let backValue = sut.back!
        // then
        XCTAssertEqual(backValue, exception)
    }
    
    func test_a와_b를_enqueue한다면_dequeue의_값은_a이다() {
        // given
        let firstValue = "a"
        let secondValue = "b"
        let exception = "a"
        // when
        sut.enqueue(firstValue)
        sut.enqueue(secondValue)
        let enqueueValue = sut.dequeue()!
        // then
        XCTAssertEqual(enqueueValue, exception)
    }
    
    func test_a를_enqueue한다면_첫번째_dequeue의_값은_a이며_두번째_dequeue의_값은_nil이다() {
        // given
        let value = "a"
        let firstException = "a"
        // when
        sut.enqueue(value)
        let firstDequeueValue = sut.dequeue()
        let secondDequeueValue = sut.dequeue()
        // then
        XCTAssertEqual(firstDequeueValue, firstException)
        XCTAssertNil(secondDequeueValue)
    }
    
    func test_a와_b를_enqueue하고_dequeue를_한다면_peek의_값은_b이다() {
        // given
        let firstValue = "a"
        let secondValue = "b"
        let exception = "b"
        // when
        sut.enqueue(firstValue)
        sut.enqueue(secondValue)
        _ = sut.dequeue()
        let peekValue = sut.peek!
        // then
        XCTAssertEqual(peekValue, exception)
    }
    
    func test_a와_b를_enqueue하고_dequeue를_한다면_back의_값은_b이다() {
        // given
        let firstValue = "a"
        let secondValue = "b"
        let exception = "b"
        // when
        sut.enqueue(firstValue)
        sut.enqueue(secondValue)
        _ = sut.dequeue()
        let peekValue = sut.peek!
        // then
        XCTAssertEqual(peekValue, exception)
    }
    
    func test_a와b_그리고_c를_enqueue한_후_removeAll을_한다면_peek는_nil이다() {
        // given
        let firstValue = "a"
        let secondValue = "b"
        let thirdValue = "c"
        // when
        sut.enqueue(firstValue)
        sut.enqueue(secondValue)
        sut.enqueue(thirdValue)
        sut.removeAll()
        // then
        XCTAssertNil(sut.peek)
    }
    
    func test_a와b_그리고_c를_enqueue한_후_removeAll을_한다면_back은_nil이다() {
        // given
        let firstValue = "a"
        let secondValue = "b"
        let thirdValue = "c"
        // when
        sut.enqueue(firstValue)
        sut.enqueue(secondValue)
        sut.enqueue(thirdValue)
        sut.removeAll()
        // then
        XCTAssertNil(sut.back)
    }
    
}

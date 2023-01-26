//  CalculatorItemQueueTest.swift
//  Created by 레옹아범 on 2023/01/24.

import XCTest
@testable import Calculator

extension String: CalculateItem {
}

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
        XCTAssertEqual(exception, backValue)
    }
}

//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by redmango1446 on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue!

    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Queue에_값이_추가된다() {
        // given
        sut.enqueue("1")
        // when
        let expectedValue = "1"
        // then
        XCTAssertEqual(sut.calculatorQueue.first, expectedValue)
    }
}

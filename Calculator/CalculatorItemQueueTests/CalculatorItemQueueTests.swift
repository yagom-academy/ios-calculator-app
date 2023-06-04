//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Serena on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    // given
    var sut: CalculatorItemQueue<Int>!

    // when
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }

    // then
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
}

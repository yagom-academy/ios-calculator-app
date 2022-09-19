//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 정선아 on 2022/09/19.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
       try super.setUpWithError()
       sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
}

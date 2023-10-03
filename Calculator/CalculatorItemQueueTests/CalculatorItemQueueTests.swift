//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 김진주 on 2023/10/03.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<MockItem>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<MockItem>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

}

class MockItem: CalculatorItem {
    
}

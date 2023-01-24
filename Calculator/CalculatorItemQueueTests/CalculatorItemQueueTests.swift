//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Rowan on 2023/01/24.
//

import XCTest

final class CalculatorItemQueueTests: XCTestCase {

    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

}

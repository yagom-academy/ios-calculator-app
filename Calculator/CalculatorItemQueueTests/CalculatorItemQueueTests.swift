//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Harry on 2023/01/24.
//

import XCTest

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculaterItemQueue!
    
    override func setUpWithError() throws {
        sut = CalculaterItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

}

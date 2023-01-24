//
//  CalculatorQueueTests.swift
//  CalculatorQueueTests
//
//  Created by 송종환 on 2023/01/25.
//

import XCTest

final class CalculatorQueueTests: XCTestCase {

    var sut: Calculate!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
       sut = nil
    }
    
    
}

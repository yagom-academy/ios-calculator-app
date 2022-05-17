//
//  CalculatorItemQueueTest.swift
//  CalculatorItemQueueTest
//
//  Created by 오경식 on 2022/05/17.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTest: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
}

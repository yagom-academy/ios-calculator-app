//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 1 on 2021/11/09.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var calculatorItemQueue: CalculatorItemQueue!

    override func setUpWithError() throws {
        try super.setUpWithError()
        calculatorItemQueue = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        calculatorItemQueue = nil
    }

    func test_enqueue호출시_queue에_1을_추가한다() {
        //expectation
        calculatorItemQueue.enqueue(1)
        
        //result
        XCTAssertNotNil(calculatorItemQueue.queue)
    }
    
    func test_enqueue호출시_queue에_plus를_추가한다() {
        //expectation
        calculatorItemQueue.enqueue(Operator.plus)
        
        //result
        XCTAssertNotNil(calculatorItemQueue.queue)
    }
}

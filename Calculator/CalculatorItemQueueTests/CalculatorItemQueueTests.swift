//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Seul Mac on 2021/11/09.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {

    func test_연산자_inbox가_비어있는지() {
        let calculatorOperator = OperatorQueue()
        XCTAssertTrue(calculatorOperator.queue.inbox.isEmpty)
    }
    
    func test_숫자_inbox가_비어있는지() {
        let calculatorNumber = NumberQueue()
        XCTAssertTrue(calculatorNumber.queue.inbox.isEmpty)
    }

}

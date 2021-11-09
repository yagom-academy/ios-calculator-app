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
    
    func test_연산자_outbox가_비어있는지() {
        let calculatorOperator = OperatorQueue()
        XCTAssertTrue(calculatorOperator.queue.outbox.isEmpty)
    }
    
    func test_숫자_outbox가_비어있는지() {
        let calculatorNumber = NumberQueue()
        XCTAssertTrue(calculatorNumber.queue.outbox.isEmpty)
    }
    
    func test_연산자_inbox에_add추가() {
        var calculatorOperator = OperatorQueue()
        calculatorOperator.queue.enqueue(.add)
        XCTAssertEqual(calculatorOperator.queue.inbox, [.add])
    }
    
    func test_연산자_inbox에_add_multiply_추가() {
        var calculatorOperator = OperatorQueue()
        calculatorOperator.queue.enqueue(.add)
        calculatorOperator.queue.enqueue(.multiply)
        XCTAssertEqual(calculatorOperator.queue.inbox, [.add, .multiply])
    }
    
    func test_연산자_inbox에_add_multiply_추가_첫번째_요소_제거_및_확인() {
        var calculatorOperator = OperatorQueue()
        calculatorOperator.queue.enqueue(.add)
        calculatorOperator.queue.enqueue(.multiply)
        let result = calculatorOperator.queue.dequeue()
        XCTAssertEqual(result, .add)
    }

}

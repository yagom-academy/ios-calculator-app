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
    
    func test_숫자_inbox에_123추가() {
        var calculatorNumber = NumberQueue()
        calculatorNumber.queue.enqueue(123)
        XCTAssertEqual(calculatorNumber.queue.inbox, [123])
    }
    
    func test_숫자_inbox에_123_124_추가() {
        var calculatorNumber = NumberQueue()
        calculatorNumber.queue.enqueue(123)
        calculatorNumber.queue.enqueue(124)
        XCTAssertEqual(calculatorNumber.queue.inbox, [123, 124])
    }
    
    func test_숫자_inbox에_123_124_추가_첫번째_요소_제거_및_확인() {
        var calculatorNumber = NumberQueue()
        calculatorNumber.queue.enqueue(123)
        calculatorNumber.queue.enqueue(124)
        let result = calculatorNumber.queue.dequeue()
        XCTAssertEqual(result, 123)
    }
    
    func test_숫자_inbox에_1_dot_23_추가() {
        var calculatorNumber = NumberQueue()
        calculatorNumber.queue.enqueue(1.23)
        XCTAssertEqual(calculatorNumber.queue.inbox, [1.23])
    }
    
    func test_숫자_inbox에_1_dot_23_1_dot_24_추가() {
        var calculatorNumber = NumberQueue()
        calculatorNumber.queue.enqueue(1.23)
        calculatorNumber.queue.enqueue(1.24)
        XCTAssertEqual(calculatorNumber.queue.inbox, [1.23, 1.24])
    }
    
    func test_숫자_inbox에_1_dot_23_1_dot_24_추가_첫번째_요소_제거_및_확인() {
        var calculatorNumber = NumberQueue()
        calculatorNumber.queue.enqueue(1.23)
        calculatorNumber.queue.enqueue(1.24)
        let result = calculatorNumber.queue.dequeue()
        XCTAssertEqual(result, 1.23)
    }
    
    func test_숫자_inbox에_1_dot_23_124_추가() {
        var calculatorNumber = NumberQueue()
        calculatorNumber.queue.enqueue(1.23)
        calculatorNumber.queue.enqueue(124)
        XCTAssertEqual(calculatorNumber.queue.inbox, [1.23, 124])
    }
    
    func test_숫자_inbox에_123_1_dot_24_추가_첫번째_요소_제거_및_확인() {
        var calculatorNumber = NumberQueue()
        calculatorNumber.queue.enqueue(123)
        calculatorNumber.queue.enqueue(1.24)
        let result = calculatorNumber.queue.dequeue()
        XCTAssertEqual(result, 123)
    }
    
    func test_숫자_inbox에_음수_1_dot_23_124_추가() {
        var calculatorNumber = NumberQueue()
        calculatorNumber.queue.enqueue(-1.23)
        calculatorNumber.queue.enqueue(124)
        XCTAssertEqual(calculatorNumber.queue.inbox, [-1.23, 124])
    }
    
    func test_숫자_inbox에_음수_123_1_dot_24_추가_첫번째_요소_제거_및_확인() {
        var calculatorNumber = NumberQueue()
        calculatorNumber.queue.enqueue(-123)
        calculatorNumber.queue.enqueue(1.24)
        let result = calculatorNumber.queue.dequeue()
        XCTAssertEqual(result, -123)
    }
    
    func test_연산자_queue가_비어있을때_dequeue시_nil_반환() {
        var calculatorOperator = OperatorQueue()
        let result = calculatorOperator.queue.dequeue()
        XCTAssertNil(result)
    }
    
    func test_숫자_queue가_비어있을때_dequeue시_nil_반환() {
        var calculatorNumber = NumberQueue()
        let result = calculatorNumber.queue.dequeue()
        XCTAssertNil(result)
    }

}

//
//  CalculatorItemQueueTests.swift
//  CalculatorTests
//
//  Created by 이승재 on 2021/11/09.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {
    var operandQueue = CalculatorItemQueue<Double>()
    var operatorQueue = CalculatorItemQueue<Operator>()
    
    override func setUp() {
        operandQueue.enqueue(1.0)
        operandQueue.enqueue(2.0)
        operandQueue.enqueue(13.5)
        operatorQueue.enqueue(.add)
        operatorQueue.enqueue(.subtract)
        operatorQueue.enqueue(.devide)
        operatorQueue.enqueue(.multiply)
    }
    
    override func tearDown() {
        operandQueue = CalculatorItemQueue<Double>()
        operatorQueue = CalculatorItemQueue<Operator>()
    }
    
    func testDequeueOperand() {
        XCTAssertEqual(operandQueue.dequeue(), 1.0)
        XCTAssertEqual(operandQueue.dequeue(), 2.0)
        XCTAssertEqual(operandQueue.dequeue(), 13.5)
    }
    
    func testRemoveLastOperand() {
        XCTAssertEqual(operandQueue.removeLast(), 13.5)
        XCTAssertEqual(operandQueue.removeLast(), 2.0)
        XCTAssertEqual(operandQueue.removeLast(), 1.0)
    }
    
    func testDequeueOperator() {
        XCTAssertEqual(operatorQueue.dequeue(), .add)
        XCTAssertEqual(operatorQueue.dequeue(), .subtract)
        XCTAssertEqual(operatorQueue.dequeue(), .devide)
        XCTAssertEqual(operatorQueue.dequeue(), .multiply)
    }
    
    func testRemoveLastOperator() {
        XCTAssertEqual(operatorQueue.removeLast(), .multiply)
        XCTAssertEqual(operatorQueue.removeLast(), .devide)
        XCTAssertEqual(operatorQueue.removeLast(), .subtract)
        XCTAssertEqual(operatorQueue.removeLast(), .add)
    }
    
    func testDequeueWhenEmpty(){
        operandQueue.dequeue()
        operandQueue.dequeue()
        operandQueue.dequeue()
        XCTAssertEqual(operandQueue.dequeue(), nil)
    }
}

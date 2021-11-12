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
        XCTAssertEqual(try operandQueue.dequeue(), 1.0)
        XCTAssertEqual(try operandQueue.dequeue(), 2.0)
        XCTAssertEqual(try operandQueue.dequeue(), 13.5)
    }
    
    func testRemoveLastOperand() {
        XCTAssertEqual(try operandQueue.removeLast(), 13.5)
        XCTAssertEqual(try operandQueue.removeLast(), 2.0)
        XCTAssertEqual(try operandQueue.removeLast(), 1.0)
    }
    
    func testDequeueOperator() {
        XCTAssertEqual(try operatorQueue.dequeue(), .add)
        XCTAssertEqual(try operatorQueue.dequeue(), .subtract)
        XCTAssertEqual(try operatorQueue.dequeue(), .devide)
        XCTAssertEqual(try operatorQueue.dequeue(), .multiply)
    }
    
    func testThrowError() {
        XCTAssertEqual(try operandQueue.removeLast(), 13.5)
        XCTAssertEqual(try operandQueue.removeLast(), 2.0)
        XCTAssertEqual(try operandQueue.removeLast(), 1.0)
        XCTAssertThrowsError(try operandQueue.dequeue())
        XCTAssertThrowsError(try operandQueue.removeLast())
    }
    
    func testRemoveLastOperator() {
        XCTAssertEqual(try operatorQueue.removeLast(), .multiply)
        XCTAssertEqual(try operatorQueue.removeLast(), .devide)
        XCTAssertEqual(try operatorQueue.removeLast(), .subtract)
        XCTAssertEqual(try operatorQueue.removeLast(), .add)
    }
    
    func testDequeueWhenEmpty(){
        operandQueue = CalculatorItemQueue<Double>()
        XCTAssertThrowsError(try operandQueue.dequeue())
    }
}

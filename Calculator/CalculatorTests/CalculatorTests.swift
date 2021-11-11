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

    func test_enqueue호출시_queue는_첫번째요소로_1을_저장하는배열이된다() {
        //expectation
        calculatorItemQueue.enqueue(1.0)
        
        //result
        XCTAssertNotNil(calculatorItemQueue.queue)
        XCTAssertEqual(calculatorItemQueue.queue[0] as! Double, 1.0)
    }
    
    func test_enqueue호출시_queue는_첫번째요소로_plus를_저장하는배열이된다() {
        //expectation
        calculatorItemQueue.enqueue(Operator.plus)
        
        //result
        XCTAssertNotNil(calculatorItemQueue.queue)
    }
    
    func test_enqueue호출시_queue는_1과_plus를_저장하는배열이된다() {
        //expctation
        calculatorItemQueue.enqueue(1)
        calculatorItemQueue.enqueue(Operator.plus)
        
        //result
        XCTAssertEqual(calculatorItemQueue.queue.count, 2)
        XCTAssertEqual(calculatorItemQueue.queue[0] as! Double, 1.0)
        XCTAssertEqual(calculatorItemQueue.queue[1] as! Operator, Operator.plus)
    }
    
    func test_dequeue호출시_queue는_빈배열이된다() {
        //expectation
        calculatorItemQueue.enqueue(1)
        calculatorItemQueue.dequeue()
        
        //result
        XCTAssertTrue(calculatorItemQueue.queue.isEmpty)
    }
    
    func test_queue가_빈배열일때_removeFisrst는_실행되지않는다() {
        //expectation
        calculatorItemQueue.dequeue()
        
        //result
        XCTAssertNoThrow(calculatorItemQueue.dequeue())
    }
    
    func test_removeAllItems호출시_queue는_빈배열이된다() {
        //expectation
        calculatorItemQueue.enqueue(1)
        calculatorItemQueue.enqueue(Operator.minus)
        calculatorItemQueue.removeAllItems()
        
        //result
        XCTAssertTrue(calculatorItemQueue.queue.isEmpty)
    }
    
    func test_queue가_빈배열일때_removeAllItems호출하면_오류를던지지않는다() {
        //expectation
        calculatorItemQueue.removeAllItems()
        
        //result
        XCTAssertNoThrow(calculatorItemQueue.removeAllItems())
    }
}

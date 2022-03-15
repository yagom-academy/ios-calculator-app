//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 우롱차 on 2022/03/14.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
        
    func test_deque_CalculatorItemQueue() {
        //given
        let calculatorItemQueue = CalculatorItemQueue()
        let firstEnqueueNumber: Float = 3
        let firstEnqueueOperation = "+"
        let secondEnqueueNumber: Float = 2
        let secondEnqueueOperation = "-"
        calculatorItemQueue.enqueue(number: firstEnqueueNumber,operation: firstEnqueueOperation)
        calculatorItemQueue.enqueue(number: secondEnqueueNumber,operation: secondEnqueueOperation)
        
        //when
        let dequeResult = calculatorItemQueue.dequeue()
        
        //then
        let resultNumber = dequeResult.number
        let resultOperation = dequeResult.operation
        
        XCTAssertEqual(firstEnqueueNumber, resultNumber)
        XCTAssertEqual(firstEnqueueOperation, resultOperation)
    }
    
    func test_deque_twice_CalculatorItemQueue() {
        //given
        let calculatorItemQueue = CalculatorItemQueue()
        let firstEnqueueNumber: Float = 3
        let firstEnqueueOperation = "+"
        let secondEnqueueNumber: Float = 2
        let secondEnqueueOperation = "-"
        calculatorItemQueue.enqueue(number: firstEnqueueNumber,operation: firstEnqueueOperation)
        calculatorItemQueue.enqueue(number: secondEnqueueNumber,operation: secondEnqueueOperation)
        
        //when
        _ = calculatorItemQueue.dequeue()
        let dequeResult = calculatorItemQueue.dequeue()
        
        //then
        let resultNumber = dequeResult.number
        let resultOperation = dequeResult.operation
        
        XCTAssertEqual(secondEnqueueNumber, resultNumber)
        XCTAssertEqual(secondEnqueueOperation, resultOperation)
    }
}

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
        let calculatorItemQueue = CalculatorItemQueue<String>()
        let firstEnqueue = "3"
        let secondEnqueue = "2"
        calculatorItemQueue.enqueue(firstEnqueue)
        calculatorItemQueue.enqueue(secondEnqueue)
        
        //when
        guard let dequeResult = calculatorItemQueue.dequeue() else {
            XCTFail()
            return
        }
        
        //then
        XCTAssertEqual(firstEnqueue, dequeResult)
    }
    
    func test_deque_twice_CalculatorItemQueue() {
        //given
        let calculatorItemQueue = CalculatorItemQueue<String>()
        let firstEnqueue = "3"
        let secondEnqueue = "2"
        calculatorItemQueue.enqueue(firstEnqueue)
        calculatorItemQueue.enqueue(secondEnqueue)
        
        //when
        guard let dequeResult = calculatorItemQueue.dequeue(),
             let dequeResult2 = calculatorItemQueue.dequeue() else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(firstEnqueue, dequeResult)
        XCTAssertEqual(secondEnqueue, dequeResult2)
    }
    
    func test_ExpressionParser_calculate() {
        //given
        let testString = "3 + 2 + 1 * 10 - 5"
        
        //when
        let formula = ExpressionParser.parse(from: testString)
        
        let result = formula.result()
        
        XCTAssertEqual(result, 55)
    }
    
    func test_ExpressionParser_calculate2() {
        //given
        let testString = "3 + 2 + 1 * 10 / 5"
        
        //when
        let formula = ExpressionParser.parse(from: testString)
        
        let result = formula.result()
        
        XCTAssertEqual(result, 12)
    }
}

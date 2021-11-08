//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 장영우 on 2021/11/08.
//

import XCTest

@testable import Calculator

class CalculatorTests: XCTestCase {
    
    func testSumCase() {
        let testQueue = CalCulatorItemQueue()
        
        for iterator in (1...10) {
            testQueue.enqueue(Adder(iterator))
        }
        
        XCTAssertEqual(testQueue.calculate(), 55)
    }
    
    func testSubtractCase() {
        let testQueue = CalCulatorItemQueue()
        
        for iterator in (1...10) {
            testQueue.enqueue(Subtractor(iterator))
        }
        
        XCTAssertEqual(testQueue.calculate(), -55)
    }
    
    func testMultiplyCase() {
        let testQueue = CalCulatorItemQueue()
        
        testQueue.enqueue(Adder(100))
        for iterator in (1...3) {
            testQueue.enqueue(Multiplier(iterator))
        }
        
        XCTAssertEqual(testQueue.calculate(), 600)
    }
    
    func testDivideCase() {
        let testQueue = CalCulatorItemQueue()
        
        testQueue.enqueue(Adder(60))
        for iterator in (1...3) {
            testQueue.enqueue(Divider(iterator))
        }
        
        XCTAssertEqual(testQueue.calculate(), 10)
    }
    
    func testClearCase() {
        let testQueue = CalCulatorItemQueue()
        
        testQueue.enqueue(Adder(10))
        testQueue.enqueue(Divider(9))
        testQueue.enqueue(Multiplier(8))
        testQueue.enqueue(Divider(2))
        
        testQueue.allClear()
        
        XCTAssertEqual(testQueue.calculate(), 0)
    }
}

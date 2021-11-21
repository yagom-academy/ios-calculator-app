//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 권나영 on 2021/11/09.
//

import XCTest

class CalculatorTests: XCTestCase {
    
    //MARK: - dequeue
    func test_빈배열일때_dequeue메서드를호출하면_에러를던지는지() {
        var calculateQueue = CalculateItemQueue<Double>()
        
        XCTAssertThrowsError(try calculateQueue.dequeue())
    }
    
    func test_enqueue메서드로_1_2_3을더했을때_dequeue메서드를호출하면_1을반환하는지() {
        var calculateQueue = CalculateItemQueue<Double>()
        calculateQueue.enqueue(element: 1)
        calculateQueue.enqueue(element: 2)
        calculateQueue.enqueue(element: 3)
        
        XCTAssertEqual(try calculateQueue.dequeue(), 1)
    }
}

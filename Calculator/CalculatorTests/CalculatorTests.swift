//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 권나영 on 2021/11/09.
//

import XCTest

class CalculatorTests: XCTestCase {
    //MARK: - enqueue
    func test_enqueue메서드로_1_2_3을더했을때_배열의마지막요소가_3인지() {
        var calculateItemQueue = CalculateItemQueue<Int>()
        calculateItemQueue.enqueue(element: 1)
        calculateItemQueue.enqueue(element: 2)
        calculateItemQueue.enqueue(element: 3)
        let result = calculateItemQueue.items.last
        XCTAssertEqual(result, 11)
    }
    
    //MARK: - dequeue
    func test_빈배열일때_dequeue메서드를호출하면_nil을반환하는지() {
        var calculateItemQueue = CalculateItemQueue<Int>()
        let result = calculateItemQueue.dequeue()
        XCTAssertNil(result)
    }
    
    func test_배열에_1_2_3이있을때_dequeue메서드를호출하면_1을반환하는지() {
        var calculateItemQueue = CalculateItemQueue(items: [1, 2, 3])
        if let output = calculateItemQueue.dequeue() {
            XCTAssertEqual(output, 1)
        }
    }
    
    func test_배열에_enqueue메서드로_1_2_3을넣고_dequeue메서드를호출했을때_1을반환하는지() {
        var calculateItemQueue = CalculateItemQueue<Int>()
        calculateItemQueue.enqueue(element: 1)
        calculateItemQueue.enqueue(element: 2)
        calculateItemQueue.enqueue(element: 3)
        let output = calculateItemQueue.dequeue()
        XCTAssertEqual(output, 1)
    }
}

//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 권나영 on 2021/11/09.
//

import XCTest

class CalculatorTests: XCTestCase {
    //MARK: - enqueue
    func test_enqueue메서드로_1_2_3을더했을때_차례대로들어가는지() {
        var calculateQueue = CalculateItemQueue<Int>()
        calculateQueue.enqueue(element: 1)
        calculateQueue.enqueue(element: 2)
        calculateQueue.enqueue(element: 3)
        
        let resultArray = calculateQueue.enqueueArray
        XCTAssertEqual(resultArray, [1, 2, 3])
    }
}

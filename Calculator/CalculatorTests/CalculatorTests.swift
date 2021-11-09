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
}

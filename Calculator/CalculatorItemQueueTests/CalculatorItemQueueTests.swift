//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 박우연 on 2021/11/09.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    
    func test_enQueue에_요소를_추가했을때_잘들어가는지() {
        var queue = CalculatorItemQueue<Int>()
        queue.enQueue(1)
        
        XCTAssertEqual(queue.enQueueArray, [1])
    }
    
    func test_enQueue에_여러개의_요소를_추가했을때_잘들어가는지() {
        var queue = CalculatorItemQueue<Int>()
        queue.enQueue(1)
        queue.enQueue(2)
        queue.enQueue(3)
        
        XCTAssertEqual(queue.enQueueArray, [1, 2, 3])
    }
}

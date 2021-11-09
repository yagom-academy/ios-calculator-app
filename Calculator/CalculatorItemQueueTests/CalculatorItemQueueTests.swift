//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 박우연 on 2021/11/09.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    
    func test_enQueue() {
        var queue = CalculatorItemQueue<Int>()
        
        queue.enQueue(1)
        
        XCTAssertEqual(queue.enQueueArray, [1])
    }

}

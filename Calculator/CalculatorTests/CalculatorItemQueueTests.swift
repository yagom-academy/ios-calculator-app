//
//  CalculatorItemQueueTests.swift
//  CalculatorTests
//
//  Created by 이승재 on 2021/11/09.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {

    
    func test_enqueueAndDequeue() {
        var queue = CalculatorItemQueue<Double>()
        queue.enqueue(1.0)
        queue.enqueue(2.0)
        queue.enqueue(13.5)
        print("queue: \(queue)")
    }
    
    func test_enqueueAndRemoveLast() {
        
    }
    
}

extension Double: CalculatorItem {
    
}

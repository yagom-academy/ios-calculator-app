//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 임지성 on 2021/11/09.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {
    var queue = CalculatorItemQueue<String>()
        
    func test_enqueue호출시_배열에값이정상적으로들어가는지() {
        let input = "2"
        
        queue.enqueue(input)
        
        XCTAssertEqual(queue.inbox, ["2"])
    }
    
    func test_enqueue를호출해값을넣고_dequeue호출시_배열에값이정상적으로빠지는지() {
        let input = "2"
        queue.enqueue(input)
        
        let result = queue.dequeue()
        
        XCTAssertEqual(result, [])
    }
}

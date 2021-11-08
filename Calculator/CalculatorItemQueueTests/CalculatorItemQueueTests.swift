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
    
    func test_enqueue를여러번호출시_배열이차례대로들어가는지() {
        var input = "2"
        queue.enqueue(input)
        input = "3"
        queue.enqueue(input)
        input = "4"
        queue.enqueue(input)
        input = "5"
        queue.enqueue(input)
       
        XCTAssertEqual(queue.inbox, ["2","3","4","5"])
    }
    
    func test_enqueue를호출해값을넣고_dequeue호출시_배열에값이정상적으로빠지는지() {
        let input = "2"
        queue.enqueue(input)
        
        let result = queue.dequeue()
        
        XCTAssertTrue(queue.inbox.isEmpty)
    }
    
    func test_배열이비어있을떄_dequeue호출시_nil이반환되는지() {
        let result = queue.dequeue()
        
        XCTAssertNil(result)
    }
    
    func test_outbox배열에값이있을때_첫번째요소를반환하는지() {
        queue.enqueue("2")
        queue.outbox = queue.inbox.reversed()
        
        let result = queue.front
        
        XCTAssertEqual(queue.outbox.last, result)
    }
}

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
        queue.enQueueElement(1)
        
        XCTAssertEqual(queue.enQueueElements, [1])
    }
    
    func test_enQueue에_여러개의_요소를_추가했을때_잘들어가는지() {
        var queue = CalculatorItemQueue<Int>()
        queue.enQueueElement(1)
        queue.enQueueElement(2)
        queue.enQueueElement(3)
        
        XCTAssertEqual(queue.enQueueElements, [1, 2, 3])
    }
    
    func test_deQueue를_실행했을때_빈배열이면_에러를던지는지() {
        var queue = CalculatorItemQueue<Int>()
       
        XCTAssertThrowsError(try queue.deQueueFirstElement())
    }
    
    func test_enQueue에_요소한개를_추가하고_deQueue했을때_빠지는지() {
        var queue = CalculatorItemQueue<Int>()
        queue.enQueueElement(1)
        
        XCTAssertThrowsError(try queue.deQueueFirstElement())
    }
    
    func test_enQueue에_요소여러개를_추가하고_deQueue했을때_마지막요소가_빠지는지() {
        var queue = CalculatorItemQueue<Int>()
        queue.enQueueElement(1)
        queue.enQueueElement(2)
        queue.enQueueElement(3)
        
        XCTAssertEqual(try queue.deQueueFirstElement(), 1)
    }
}

//
//  CalculatorItemQueueTest.swift
//  CalculatorTests
//
//  Created by 이차민 on 2021/11/09.
//

import XCTest

class CalculatorItemQueueTest: XCTestCase {
    func test_큐에_데이터를_2개_넣었을_떄_큐의_개수가_2인지() {
        let queue = CalculatorItemQueue<Double>()
        queue.enqueue(3.5)
        queue.enqueue(4.5)
        XCTAssertEqual(2, queue.items.count)
    }
    
    func test_비어있는_큐에서_데이터를_빼내려고_할때_nil이_반환되는지() {
        let queue = CalculatorItemQueue<Double>()
        XCTAssertEqual(nil, queue.dequeue())
    }
    
    func test_비어있지_않은_큐에서_데이터를_빼내려고_할때_정상적으로_앞에_요소가_제거되는지() {
        let queue = CalculatorItemQueue<Double>()
        queue.enqueue(3.5)
        queue.enqueue(4.5)
        queue.dequeue()
        XCTAssertEqual(4.5, queue.items.first?.value)
    }
    
    func test_비어있지_않은_큐에서_데이터를_빼내려고_할때_정상적으로_앞에_요소가_제거되고_반환되는지() {
        let queue = CalculatorItemQueue<Double>()
        queue.enqueue(3.5)
        queue.enqueue(4.5)
        let value = queue.dequeue()
        XCTAssertEqual(3.5, value)
        XCTAssertEqual(1, queue.items.count)
    }
    
    func test_큐의_모든_데이터를_삭제하는_경우_모두_삭제가_되는지() {
        let queue = CalculatorItemQueue<Double>()
        queue.enqueue(3.5)
        queue.enqueue(4.5)
        queue.enqueue(5.5)
        queue.removeAll()
        XCTAssertEqual(0, queue.items.count)
    }
    
    func test_큐의_데이터_개수가_1개_이상인지() {
        let queue = CalculatorItemQueue<Double>()
        queue.enqueue(4.5)
        XCTAssertTrue(queue.hasOneOrMoreItems)
    }
}

//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by yeha on 2021/11/09.
//

import XCTest

class CalculatorTests: XCTestCase {
    func test_큐에_Int_추가하기() {
        var queue = CalculateItemQueue<Int>()
        queue.enqueue(1)
        queue.enqueue(-1)
        XCTAssertEqual(queue.items, [1, -1])
    }
    
    func test_큐에_Double_추가하기() {
        var queue = CalculateItemQueue<Double>()
        queue.enqueue(1.0)
        queue.enqueue(-1.0)
        XCTAssertEqual(queue.items, [1.0, -1.0])
    }
    
    func test_큐에_연산자_추가하기() {
        var queue = CalculateItemQueue<String>()
        queue.enqueue("/")
        queue.enqueue("*")
        XCTAssertEqual(queue.items, ["/", "*"])
    }
    
    func test_큐에서_Double_삭제하기() {
        var queue = CalculateItemQueue<Double>()
        queue.enqueue(1.0)
        queue.enqueue(-1.0)
        queue.dequeue()
        XCTAssertEqual(queue.items, [-1.0])
    }
    
    func test_큐를_비우기() {
        var queue = CalculateItemQueue<Double>()
        queue.enqueue(1.0)
        queue.enqueue(-1.0)
        queue.clean()
        XCTAssertEqual(queue.items, [])
    }
}

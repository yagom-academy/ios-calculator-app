//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Kyo on 2022/09/20.
//

import XCTest

@testable import Calculator
class CalculatorItemQueueTests: XCTestCase {
    
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_count_확인() {
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        XCTAssertTrue(sut.count() == 3)
    }
    
    func test_enque_3번_후_count확인() {
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        XCTAssertEqual(sut.count(), 3)
    }
    
    func test_enque_3번_후_front확인() {
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        guard let front = sut.first() else { return }
        XCTAssertEqual(front, 1.0)
    }
    
    func test_enque_2번_후_dequeue_front확인() {
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        sut.dequeue()
        guard let front = sut.first() else { return }
        XCTAssertEqual(front, 2.0)
    }
    
    func test_enque_3번_후_last확인() {
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        guard let last = sut.last() else { return }
        XCTAssertEqual(last, 3.0)
    }
    
    func test_enque_3번_후_dequeue_1번_count확인() {
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        sut.dequeue()
        XCTAssertEqual(sut.count(), 2)
    }
    
    func test_enque_1번_후_deque_2번() {
        sut.enqueue(1.0)
        sut.dequeue()
        sut.dequeue()
        XCTAssertEqual(sut.count(), 0)
    }
    
    func test_enque_3번_후_removeAll실행후_count확인() {
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        sut.removeAll()
        XCTAssertEqual(sut.count(), 0)
    }
}

//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Kyo on 2022/09/20.
//

import XCTest

@testable import Calculator
class CalculatorItemQueueTests: XCTestCase {
    
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_count_확인() {
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        XCTAssertTrue(sut.count() == 3)
    }
    
    func test_enque_3번_후_count확인() {
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        XCTAssertEqual(sut.count(), 3)
    }
    
    func test_enque_3번_후_front확인() {
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        guard let front = sut.front() else { return }
        XCTAssertEqual(front, "1")
    }
    
    func test_enque_2번_후_dequeue_front확인() {
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        sut.dequeue()
        guard let front = sut.front() else { return }
        XCTAssertEqual(front, "2")
    }
    
    func test_enque_3번_후_last확인() {
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        guard let last = sut.last() else { return }
        XCTAssertEqual(last, "3")
    }
    
    func test_enque_3번_후_dequeue_1번_count확인() {
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        sut.dequeue()
        XCTAssertEqual(sut.count(), 2)
    }
    
    func test_enque_1번_후_deque_2번() {
        sut.enqueue("1")
        sut.dequeue()
        sut.dequeue()
        XCTAssertEqual(sut.count(), 0)
    }
    
    func test_enque_3번_후_removeAll실행후_count확인() {
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        sut.removeAll()
        XCTAssertEqual(sut.count(), 0)
    }
}

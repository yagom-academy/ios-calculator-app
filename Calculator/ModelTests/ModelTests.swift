//
//  ModelTests.swift
//  ModelTests
//
//  Created by Red on 2022/03/15.
//

import XCTest
@testable import Calculator

class ModelTests: XCTestCase {
    var sut: CalculatorItemQueue!
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_enqueue_DoubleType을넣었을때() {
        // given
        let numberValue: Double = 10
        // when
        sut.enqueue(with: numberValue)
        guard let result = sut.queue[sut.head] as? Double else { return }
        // then
        XCTAssertEqual(result, numberValue)
    }
    
    func test_enqueue_OperatorType을넣었을때() {
        // given
        let operatorValue: Operator = .add
        // when
        sut.enqueue(with: operatorValue)
        guard let result = sut.queue[sut.tail] as? Operator else { return }
        // then
        XCTAssertEqual(result, operatorValue)
    }
    
    func test_dequeue_DoubleType을뺄때() {
        // when
        sut.enqueue(with: 1.0)
        sut.enqueue(with: Operator.add)
        sut.enqueue(with: 2.0)
        guard let result = sut.dequeue() as? Double else { return }
        // then
        XCTAssertEqual(result, 1.0)
    }
    
    func test_dequeue_DoubleType을넣었을때() {
        // when
        sut.enqueue(with: 1.0)
        sut.enqueue(with: Operator.add)
        sut.enqueue(with: 2.0)
        _ = sut.dequeue()
        guard let result = sut.dequeue() as? Operator else { return }
        // then
        XCTAssertEqual(result, Operator.add)
    }
    
    func test_dequeue_queue가비어있을때_nil() {
        let result1 = sut.dequeue()
        
        sut.enqueue(with: 1.0)
        sut.enqueue(with: 2.0)
        _ = sut.dequeue()
        _ = sut.dequeue()
        let result2 = sut.dequeue()
        let result3 = sut.queue.isEmpty
        XCTAssertNil(result1)
        XCTAssertNil(result2)
        XCTAssertTrue(result3)
    }
    
    func test_reset_queue를초기화() {
        sut.reset()
        let result = sut.queue.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_reset_head와tail을초기화() {
        sut.reset()
        let result = sut.head == 0 && sut.tail == 0
        XCTAssertTrue(result)
    }
    
}

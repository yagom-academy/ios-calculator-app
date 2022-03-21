//
//  ModelTests.swift
//  ModelTests
//
//  Created by Red on 2022/03/15.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTest: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<Double>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_enqueue_값을넣을때_dequeue_값을뺄때() {
        let expectedValue: Double = 10
        sut.enqueue(with: expectedValue)
        let result = sut.dequeue()
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_dequeue_queue가비어있을때_nil() {
        let result1 = sut.dequeue()
        
        sut.enqueue(with: 1.0)
        sut.enqueue(with: 2.0)
        _ = sut.dequeue()
        _ = sut.dequeue()
        let result2 = sut.dequeue()
        XCTAssertNil(result1)
        XCTAssertNil(result2)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_reset_queue를초기화() {
        sut.reset()
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }
}

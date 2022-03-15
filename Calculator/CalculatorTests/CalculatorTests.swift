//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Marisol Mirim Kim on 2022/03/15.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_enqueue() {
        // given
        let input: Double = 1.0
        // when
        sut.enqueue(input)
        let result = sut.queue
        // then
        XCTAssertEqual(result, [1.0])
    }
    
    func test_dequeue() {
        // given
        let input: Double = 2.0
        // when
        sut.enqueue(input)
        let result = sut.dequeue()
        let queue = sut.queue
        // then
        XCTAssertEqual(result, 2.0)
        XCTAssertEqual(queue, [nil])
    }
}

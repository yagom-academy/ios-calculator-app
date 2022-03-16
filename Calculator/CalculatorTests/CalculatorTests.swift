//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Marisol Mirim Kim on 2022/03/15.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_enqueue에는_Double타입의값을_추가할수있다() {
        // given
        let input: Double = 1.0
        // when
        sut?.enqueue(input)
        let result = sut?.queue
        // then
        XCTAssertEqual(result, [1.0])
    }
    
    func test_dequeue하면_element를리턴하고_queue에서는nil로처리된다() {
        // given
        let input: Double = 2.0
        // when
        sut?.enqueue(input)
        let result = sut?.dequeue()
        let queue = sut?.queue
        // then
        XCTAssertEqual(result, 2.0)
        XCTAssertEqual(queue, [nil])
    }
}

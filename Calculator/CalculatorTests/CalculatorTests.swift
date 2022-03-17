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
        let result = sut?.nodeList
        // then
        XCTAssertEqual(result, [1.0])
    }
    
    func test_dequeue하면_element를리턴하고_queue에서는nil로처리된다() {
        // given
        let input: Double = 2.0
        // when
        sut?.enqueue(input)
        let result = sut?.dequeue()
        let queue = sut?.nodeList
        // then
        XCTAssertEqual(result, 2.0)
        XCTAssertEqual(queue, [nil])
    }
    
    func test_queue가_비어있을때_isEmpty가_true를리턴한다() {
        // given
        // when
        let result = sut?.isEmpty
        // then
        XCTAssertEqual(result, true)
    }
    
    func test_queue가_비어있지않을때_isEmpty가_false를리턴한다() {
        // given
        sut?.enqueue(1.0)
        // when
        let result = sut?.isEmpty
        // then
        XCTAssertEqual(result, false)
    }
    
    func test_queue의count가_enqueue할때마다_업데이트된다() {
        // given
        let input1: Double = 1.0
        let input2: Double = 2.0
        // when
        sut?.enqueue(input1)
        sut?.enqueue(input2)
        let result = sut?.count
        // then
        XCTAssertEqual(result, 2)
    }
}

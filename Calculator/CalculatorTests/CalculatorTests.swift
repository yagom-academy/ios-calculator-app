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
    
    func test_dequeue하면_element를리턴한다() {
        // given
        let input: Double = 2.0
        // when
        sut?.enqueue(input)
        let result = sut?.dequeue()
        // then
        XCTAssertEqual(result, 2.0)
    }
    
    func test_nodeList가_비어있을때_isEmpty가_true를리턴한다() {
        // given
        // when
        let result = sut?.isEmpty
        // then
        XCTAssertEqual(result, true)
    }
    
    func test_nodeList가_비어있지않을때_isEmpty가_false를리턴한다() {
        // given
        sut?.enqueue(1.0)
        // when
        let result = sut?.isEmpty
        // then
        XCTAssertEqual(result, false)
    }
    
    func test_nodeList의count가_enqueue할때마다_업데이트된다() {
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

//
//  CalculatorItemQueueTests.swift
//  Created by 미니.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    var testNumber: Double!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    


    func test_인큐를_한_후에_isEmpty가_false인가() {
        // when
        sut.enqueue(1)
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }

    func test_인큐_3개_넣고_순서대로_잘들어갔는가() {
        // given
        let values: [Double] = [1,2,3]

        // when
        values.forEach { sut.enqueue($0) }
        let result = sut.inputStack
        
        // then
        XCTAssertEqual(result, values)
    }

    func test_인큐_3개_넣고_디큐_3번하면_isEmpty가_true인가() {
        // given
        let values: [Double] = [1, 2, 3]

        // when
        values.forEach { sut.enqueue($0) }
        sut.dequeue()
        sut.dequeue()
        sut.dequeue()
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }

    func test_인큐_3번하고_디큐4번했을때_마지막_반환값이_nil인가() {
        // given
        let values: [Double] = [1, 2, 3]

        // when
        values.forEach { sut.enqueue($0) }
        sut.dequeue()
        sut.dequeue()
        sut.dequeue()
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
}

//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by mmim.
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
    
    func test_빈배열에_1을_enqueue하면_추가되는가() {
        // given
        let input = 1.0
        // when
        sut.enqueue(input)
        let result = sut.first
        // then
        XCTAssertEqual(result, 1.0)
    }
    
    func test_빈배열에_여러번_enqueue하면_마지막값이_정상반환되는가() {
        // given
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        sut.enqueue(4.0)
        // when
        let result = sut.last
        // then
        XCTAssertEqual(result, 4.0)
    }
    
    func test_빈배열에서_값을_dequeue하면_nil을_반환하는가() {
        // given
        
        // when
        let result = sut.dequeue()
        // then
        XCTAssertNil(result)
    }
    
    func test_값이_있는_배열에_dequeue하면_정상반환하는가() {
        // given
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        // when
        let result = sut.dequeue()
        // then
        XCTAssertEqual(result, 1.0)
    }
    
    func test_값이_하나인_배열에_dequeue하면_정상반환하는가() {
        // given
        sut.enqueue(2.0)
        // when
        let result = sut.dequeue()
        // then
        XCTAssertEqual(result, 2.0)
    }
    
    func test_enqueue를_2번_dequeue를_2번하면_정상반환하는가() {
        // given
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        // when
        let _ = sut.dequeue()
        let result = sut.dequeue()
        // then
        XCTAssertEqual(result, 2.0)
    }
    
    func test_enqueue를_1번_dequeue를_2번하면_nil을_반환하는가() {
        // given
        sut.enqueue(1.0)
        // when
        let _ = sut.dequeue()
        let result = sut.dequeue()
        // then
        XCTAssertEqual(result, nil)
    }
    
    func test_배열의_count를_정상적으로_반환하는가() {
        // given
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        sut.enqueue(4.0)
        // when
        let result = sut.count
        // then
        XCTAssertEqual(result, 4)
    }
    
    func test_배열의_removeAll이_정상적으로_작동하는가() {
        // given
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        sut.enqueue(4.0)
        // when
        sut.removeAll()
        // then
        XCTAssertTrue(sut.isEmpty)
    }
}

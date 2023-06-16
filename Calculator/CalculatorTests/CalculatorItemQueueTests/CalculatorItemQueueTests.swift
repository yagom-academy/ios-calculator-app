//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Zion & Dasan on 2023/06/16.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue_enqueue_5를하고_dequeue를하면_5을반환한다() {
        // given
        sut.enqueue(5)
        let expectation = 5.0
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_queue가_비어있을때_dequeue를하면_nil을_반환한다() {
        // given, when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_dequeue_enqueue_1_2_3을하고_dequeue를하면_dequeue는_1을반환한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        let expectation = 1.0
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_enqueue_1_을하고_dequeue를_2번하면_nil을_반환한다() {
        // given
        sut.enqueue(1)
        
        // when
        let _ = sut.dequeue()
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
}

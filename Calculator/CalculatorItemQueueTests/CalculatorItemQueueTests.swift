//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by karen on 2023/06/07.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_빈_큐일_때_isEmpty는_true를_반환한다() {
        // given
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, true)
    }
    
    func test_enqueue를_하지_않고_dequeue를_하면_Nil을_반환한다() {
        // given
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, nil)
    }
    
    func test_enqueue_1을_했을때_isEmpty는_false이다() {
        // given
        sut.enqueue(1)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, false)
    }
    
    func test_enqueue_1을_하고_dequeue를_했을_때_isEmpty는_true이다() {
        // given
        sut.enqueue(1)
        _ = sut.dequeue()
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, true)
    }
}

//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by redmango1446 on 2023/06/01.
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
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_dequeue_enqueue를_하지_않고_dequeue를_하면_Nil이_반환된다() {
        // given
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_count_enqueue를_하지_않으면_count는_0을_가진다() {
        // given
        // when
        let result = sut.count
        let expectedValue = 0
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_count_1을_2번_enqueue하면_count는_2를_가진다() {
        // given
        sut.enqueue(1)
        sut.enqueue(1)
        
        // when
        let result = sut.count
        let expectedValue = 2
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_count_5를_2번_enqueue하고_dequeue를_1번하면_count는_1을_가진다() {
        // given
        sut.enqueue(5)
        sut.enqueue(5)
        _ = sut.dequeue()
        
        // when
        let result = sut.count
        let expectedValue = 1
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_isEmpty_enqueue하지_않으면_isEmpty는_true를_가진다() {
        // given
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_first_enqueue를_안하면_first는_nil을_가진다() {
        // given
        // when
        let result = sut.first
        
        // then
        XCTAssertNil(result)
    }
    
    func test_first_1을_enqueue하면_first는_1을_가진다() {
        // given
        sut.enqueue(1)
        
        // when
        let result = sut.first
        let expectedValue = 1
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_first_1과_2를_enqueue하면_first는_1을_가진다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        
        // when
        let result = sut.first
        let expectedValue = 1
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_last_enqueue를_안하면_last는_nil을_가진다() {
        // given
        // when
        let result = sut.last
        
        // then
        XCTAssertNil(result)
    }
    
    func test_last_1을_enqueue하면_last는_1을_가진다() {
        // given
        sut.enqueue(1)
        
        // when
        let result = sut.last
        let expectedValue = 1
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_last_1과_2를_enqueue하면_last는_2를_가진다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        
        // when
        let result = sut.last
        let expectedValue = 2
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_dequeue_1을_enqueue하고_dequeue를_하면_1이_반환된다() {
        // given
        sut.enqueue(1)
        
        // when
        let result = sut.dequeue()
        let expectedValue = 1
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_dequeue_1과_2를_enqueue하고_dequeue를_하면_1이_반환된다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        
        // when
        let result = sut.dequeue()
        let expectedValue = 1
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_dequeue_1과_2를_enqueue하고_dequeue를_2번_하면_2가_반환된다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        
        // when
        var result = sut.dequeue()
        result = sut.dequeue()
        let expectedValue = 2
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
}

//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by NAMU on 2022/05/17.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enQueue_큐에값이추가되는지() {
        // given
        sut.enQueue(data: 1)
        
        // when
        let result = sut.list.takeOutFirst()
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_deQueue_큐에서첫번째값을반환하는지() {
        // given
        sut.enQueue(data: 1)
        
        // when
        let result = sut.deQueue()
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_enQueue_큐에값을여러개추가하고_삭제했을때_순서대로가져오는지() {
        // given
        sut.enQueue(data: 1)
        sut.enQueue(data: 2)
        
        // when
        let result1 = sut.deQueue()
        let result2 = sut.deQueue()
        
        // then
        XCTAssertEqual(result1, 1)
        XCTAssertEqual(result2, 2)
    }
    
    func test_isEmpty_큐에값이있을때_false를반환하는지() {
        // given
        sut.enQueue(data: 1)
        
        // when
        let result = sut.isEmpty()
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_removeAll_값이있을때_모든값을제거하는지() {
        // given
        sut.enQueue(data: 1)
        sut.enQueue(data: 2)
        
        // when
        sut.removeAll()
        let result = sut.isEmpty()
        
        // then
        XCTAssertTrue(result)
    }
}

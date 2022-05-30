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
    
    //MARK: - enqueue test
    func test_enqueue_큐에값이추가되는지() {
        // given
        sut.enqueue(data: 1)
        
        // when
        let result = sut.peek()
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    //MARK: - dequeue test
    func test_dequeue_큐에서첫번째값을반환하는지() {
        // given
        sut.enqueue(data: 1)
        
        // when
        let result = 1
        
        // then
        XCTAssertEqual(result, sut.dequeue())
    }
    
    func test_dequeue_큐에값을여러개추가하고_삭제했을때_순서대로가져오는지() {
        // given
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        
        // when
        let result1 = 1
        let result2 = 2
        
        // then
        XCTAssertEqual(result1, sut.dequeue())
        XCTAssertEqual(result2, sut.dequeue())
    }
    
    //MARK: - isEmpty test
    func test_isEmpty_큐에값이있을때_false를반환하는지() {
        // given
        sut.enqueue(data: 1)
        
        // when
        let result = sut.isEmpty()
        
        // then
        XCTAssertFalse(result)
    }
    
    //MARK: - removeAll test
    func test_removeAll_값이있을때_모든값을제거하는지() {
        // given
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        
        // when
        sut.removeAll()
        let result = sut.isEmpty()
        
        // then
        XCTAssertTrue(result)
    }
}
